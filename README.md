SMS_Journal
===========

smsjournal.herokuapp.com

Web application that allows user to sign up and receive a daily text message. The user has the chance to respond to the text message and the responses will be saved as part of his/her online journal. Users can go online and sign in to view their responses.

To-Do List
----------

- Set up tunnlr or something that exposes localhost to server and allows for reception of SMS
- Sessions controller and authentication
- Verification of users' phones
- Verification tests
- Error messages tests
- Questions and Responses MVC
- Add admins
- Make pretty

Changelog 
---------

2013-05-06

M
- Updated model associations
- Finished user model besides admins

V
- Header and error messages partials

C
- New user sign-up finished

Tests
- New user sign-up
- Started user pages
- Adjusted Bcrypt for faster rspec tests
- FactoryGirl to help with user creation for tests

Other
- Set up heroku
- SSL in production = true
