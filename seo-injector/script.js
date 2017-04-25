function seo_injector_submit_desc( table_stub ) {
	document.getElementById( 'sql' ).value = 'describe ' + table_stub;
	document.forms['seo_injector'].submit();
}

function seo_injector_check_sql() {
	sql = document.getElementById( 'sql' ).value;
	if ( sql.match( /\s*(alter|create|drop|rename|insert|delete|update|replace|truncate) /i ) ) {
		return confirm( "SEO Injection is permanent, are you absolutely positive you want to do this?" );
	} else {
		return true;
	}
}
