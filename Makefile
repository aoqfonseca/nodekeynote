help:
	@echo 'runserver    :inicia o servidor local'
	@echo 'test         :roda os spec (jasmine)'

runserver:
	@node server.js

test:
	@node node_modules/jasmine-node/bin/jasmine-node  spec --color
