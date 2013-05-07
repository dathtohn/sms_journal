SMS_Journal
===========

smsjournal.herokuapp.com

Web application that allows user to sign up and receive a daily text message. The user has the chance to respond to the text message and the responses will be saved as part of his/her online journal. Users can go online and sign in to view their responses.

To-Do List
----------

- Set up tunnlr or something that exposes localhost to server and allows for reception of SMS
- Verification of users' phones
- Error messages tests
- Questions and Responses MVC
- Add admins
- Make pretty
	- title provide

Changelog 
---------

### 2013-05-07

M

V
- profile, settings, sign in, and sign out for users

C
- sessions authentication, sign in, sign out, and remember_token

Tests
- authentication_pages

### 2013-05-06

M
- updated model associations
- finished user model besides admins

V
- created header and error messages partials

C
- finished new user sign-up
- header and error messages partials
- user show
- sign in (sessions#new)

Tests
- finished new user sign-up
- started user pages
- adjusted Bcrypt for faster rspec tests
- installed FactoryGirl to help with user creation for tests

Other
- set up heroku
- forced SSL in production = true
