## Authentication

We are going to add authentication to a Rails app. Authentication is sometimes called _login_ but it typically has more features than logging users in.

We're going to use the Devise gem to implement authentication. Devise is one, of many, ways to implement authentication in Rails. 


## Authentication is NOT Authorization
A _very_ typical miscomprehension is that login/authentication is used to implement authorization.

Authentication is allowing, restricting or constraining some set of behavior or operations. Typically, this is done using Roles as in Role Base Authorization Control, (RBAC). 


### Setup RSpec 
	`rails g rspec:install`

## Devise
### Add gem

* Add the devise gem to the Gemfile  
	`gem 'devise'`
	
* Install the gem with Bundler  
	`bundle install`

### Install/Setup
* Setup Devise in your app. Follow the directions in the install.  
	`rails g devise:install`

* Add flash handing to the Layout, above the yield
<code>
<% flash.each do |name, msg| %>  
  <% if msg.is_a?(String) %>  
    <%= content_tag :div, msg, :class => "flash_#{name}" %>  
  <% end %>  
<% end %>  
</code>

* Copy the Devise views to your app.



#### Lets look at the i18n YAML internationalization file that will define messages for Devise.
open config/locales/devise.en.yml

#### Lets Look at the initialization file.
open config/initializers/devise.rb

### Generate a User model 	
	`rails generate devise User`
	
#### Lets Look at the migrations file.
open db/migrate/...

## Devise Modules
* database-authenticatable  	Handles authentication of a user, as well as password encryption.
* confirmable  	Adds the ability to require email confirmation of user accounts.
*lockable  	Can lock an account after n number of failed login attempts. recoverable Provides password reset functionality.
* registerable  	Alters user sign up to be handled in a registration process, along with account management.* rememberable  	Provides remember me functionality. 
* timeoutable  	Allows sessions to be expired in a configurable time frame.* trackable:	Stores login counts, timestamps, and IP addresses.* validatable	Adds customizable validations to email and password.* omniauthable	Adds Omniauth2 support

### References


