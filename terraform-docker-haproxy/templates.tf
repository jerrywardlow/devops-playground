data "template_file" "index_html" {
    template = "${file("templates/index.html.tpl")}"
    
    vars {}
}
