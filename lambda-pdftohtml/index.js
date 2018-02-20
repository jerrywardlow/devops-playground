var AWS = require('aws-sdk');
var memorystream = require('memorystream');
var wkhtmltopdf = require('wkhtmltopdf');

process.env['PATH'] = process.env['PATH'] + ':' + process.env['LAMBDA_TASK_ROOT'];

exports.handler = function(event, context) {
    var mem_stream = new memorystream();
    var html_payload = new Buffer(event.html_base64, 'base64').toString('utf8');
}
