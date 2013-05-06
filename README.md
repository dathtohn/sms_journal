SMS_Journal
===========

smsjournal.herokuapp.com

Web application that allows user to sign up and receive a daily text message. The user has the chance to respond to the text message and the responses will be saved as part of his/her online journal. Users can go online and sign in to view their responses.

To-Do List
----------

- Set up tunnlr or something that exposes localhost to server and allows for reception of SMS
- Sessions controller and authentication
- Verification of users' phones
- Make pretty

Changelog 
---------

2013-05-06

Set-up
- Set up heroku
- SSL in production = true

M
- Updated model associations

V
- Header and error messages partials

C
- New user sign-up finished

Tests
- New user sign-up (need to do verification tests)
- Started user pages
- Adjusted Bcrypt for faster rspec tests
- FactoryGirl to help with user creation for tests
