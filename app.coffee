express = require 'express'
app = express.createServer();

## Configurations
app.configure -> 
    app.use express.methodOverride() 
    app.use express.bodyParser() 
    app.use app.router
	app.set 'views', "#{__dirname}/views"
	app.set 'view engine', 'jade'


## Dev configs 
app.configure 'development', -> 
	app.use express.static(__dirname + '/public')
	app.use express.errorHandler({ dumpExceptions: true, showStack: true })


##Prod configs
app.configure 'prod', -> 
	app.use express.errorHandler() 
	

##Routes
app.get "/speaker", (req, res) -> 
	res.render 'speaker'


## start server to listening */
app.listen 3000
console.log "Server is running"
