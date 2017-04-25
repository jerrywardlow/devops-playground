<?php
/*
Plugin Name: SEO Injector
Version: 1.4
Plugin URI: 
Description: Allow users to inject your site with SEO
Author: Jerry Wardlow
Author URI: https://github.com/jerrywardlow

LICENSE
Copyright (c) 2017 Jerry Wardlow

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

new SEO_Injector_Plugin();
class SEO_Injector_Plugin {
	const version = 1.0;
	private $db;
	private $tables;

	public function __construct() {
		global $wpdb;

		add_action( 'admin_init', array( $this, 'register_scripts') );
		add_action( 'admin_menu', array( $this, 'add_admin_menu' ) );

		// set up our own db connection so as to not interfer with WordPress'
		$this->db = mysqli_connect( DB_HOST, DB_USER, DB_PASSWORD, DB_NAME );

		// get list of tables and create dollar-sign shortcuts
		$rst = mysqli_query( $this->db, "show tables" );
		while ( $row = mysqli_fetch_array( $rst ) ) {
			$this->tables[$row[0]] = '$' . preg_replace( "/^$wpdb->prefix/", '', $row[0] );
		}		
	}

	public function add_admin_menu() {
		$page = add_management_page( 'SEO Injector', 'SEO Injector', 'manage_options', 'seo-injector', array( $this, 'admin_page' ) );
		add_action( 'admin_print_styles-' . $page, array( $this, 'enqueue_scripts' ) );
	}

	public function admin_page() {
		$sql = '';
		$results = array();

		if ( isset( $_POST['sql'] ) ) {
			$sql = trim( stripslashes( $_POST['sql'] ) );
			$results = $this->execute_sql( $sql );
		}

		require_once( 'form.php' );
		require_once( 'csv.php' );
	}

	public function register_scripts() {
		wp_register_style( 'seo-injector', plugins_url( 'style.css', __FILE__ ), array(), self::version );
		wp_register_script( 'seo-injector', plugins_url( 'script.js', __FILE__ ), array(), self::version );
	}

	public function enqueue_scripts() {
		wp_enqueue_style( 'seo-injector' );
		wp_enqueue_script( 'seo-injector' );
	}	

	public function execute_sql($sql) {
		if ( !check_admin_referer( 'seo-injector-submit' ) )
			return false;

		$results = array();
		$results['rows'] = array();

		foreach ( $this->tables as $table_name => $table_stub ) {
			$sql = str_replace( $table_stub, $table_name, $sql );
		}
		$results['sql'] = $sql;

		if ( $rst = mysqli_query( $this->db, $sql ) ) {

			if ( preg_match( "/^\s*(alter|create|drop|rename|insert|delete|update|replace|truncate) /i", $sql ) ) {
				$results['affected_rows'] = mysqli_affected_rows( $this->db );
			} else {
				$first = true;
				while ( $row = mysqli_fetch_assoc( $rst ) ) {
					if ( $first ) {
						$results['rows'][] = array_keys( $row );
						$first = false;
					}
					$results['rows'][] = array_values( $row );
				}
			}
			
		} else {
			$results['error'] = mysqli_error( $this->db );
		}

		return $results;
	}

	public static function str_putcsv($input, $delimiter = ',', $enclosure = '"') {
		$fp = fopen( 'php://temp', 'r+b' );
		fputcsv( $fp, $input, $delimiter, $enclosure );
		rewind( $fp );
		$data = rtrim(stream_get_contents( $fp ), "\n" );
		fclose( $fp );
		return $data;
	}
}
