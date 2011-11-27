express = require 'express'
app = express.createServer();

## Configurations
app.configure ->
    app.use express.methodOverride() 
    app.use express.bodyParser() 
    app.use app.router
	app.set 'views', "#{__dirname}/views"
	app.set 'view engine', 'jade'
	app.use express.cookieParser();
	app.use express.session({secret : "churupita" }) 
	app.use express.static(__dirname + '/public')


## Dev configs 
app.configure 'development', -> 
	app.use express.errorHandler({ dumpExceptions: true, showStack: true })


##Prod configs
app.configure 'prod', -> 
	app.use express.errorHandler() 

#middleware for auth
has_permission = (req,res, next) -> 
	next()
#	if res.session.user? and res.session.user=='chefe'
#		next()
#	else
#		res.redirect('/error_invalid.html')

##Routes
app.get "/speaker", has_permission, (req, res) -> 
	res.render 'speaker'


## start server to listening */
app.listen 3000
console.log "Server is running"
