var http = require('http');
var handleRequest = function(request, response) {
    console.log('Received request for URL: ' + request.url);
    console.log('Request sent from: ' + request.connection.remoteAddress);
    response.writeHead(200);
    response.end('Hello World!');
};

var www = http.createServer(handleRequest);
www.listen(8080);
