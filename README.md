SMS_Journal
===========

smsjournal.herokuapp.com

Web application that allows user to sign up and receive a daily text message. The user has the chance to respond to the text message and the responses will be saved as part of his/her online journal. Users can go online and sign in to view their responses.

Changelog 
---------

2013-05-06

- Set up heroku
- Updated model associations
- New user sign-up finished
- Set up rspec
	- New user sign-up (need to do verification tests)
	- Started user pages
- SSL in production = true
- Bcrypt

	  require 'bcrypt'
    silence_warnings do
        BCrypt::Engine::DEFAULT_COST = BCrypt::Engine::MIN_COST
    end

