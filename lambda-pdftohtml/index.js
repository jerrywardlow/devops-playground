var AWS = require('aws-sdk');
var memorystream = require('memorystream');
var wkhtmltopdf = require('wkhtmltopdf');

process.env['PATH'] = process.env['PATH'] + ':' + process.env['LAMBDA_TASK_ROOT'];
