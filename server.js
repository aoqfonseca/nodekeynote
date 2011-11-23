var express = require('express')
	, app = express.createServer();

/* Configurations*/
app.configure(function(){
    app.use(express.methodOverride());
    app.use(express.bodyParser());
    app.use(app.router);
});

app.configure('development', function(){
	app.use(express.static(__dirname + '/public'));
	app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
});

/* start server to listening */
app.listen(3000);
console.log("Server is running");
