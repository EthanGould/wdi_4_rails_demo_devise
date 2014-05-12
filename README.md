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
	
#### Look at the routes.rb file and run rake routes.
You should see many new routes. And they reference controllers that are __NOT__
in your app? Where are they?


#### User Sessions


A User will have a "session" with the application after they have successfully
logged in. This session will typically last for a specific period of time in the user is inactive.

The session is a hash that contains a very _limited_ set of data about a user that will be shared between the client/browser and the server. 

For example, the session will have the current user's id. This is typically the primary key for that user in the users table.

The session is stored in a cookie that is kept and maintained by the browser.


Devise provides a way to handle Session resources. Running rake routes will show you what Devise provides to manage a user's session.

_Show me the form to login and create a session_
 <code> new_user_session GET    /users/sign_in(.:format)       devise/sessions#new  </code>  

_Create a session for this logged in user_
<code>  user_session POST   /users/sign_in(.:format)       devise/sessions#create</code>

_Delete the session for a user_
<code> destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy</code>

So, we now have a set of routes a controller and a login form for the Session.

#### User registration
Devise can manage the registration of users. Which types of features an application can use can be configured by Devise.

<table>
<thead>
<th>URL Helper</th><th>HTTP Method</th><th>Path</th><th>Controller#Action</th>
</thead>
<tbody>
<tr><<td>cancel_user_registration</td><td>GET</td><td>/users/cancel(.:format)</td><td>devise/registrations#cancel</td></tr>

<tr><td>user_registration</td><td>POST</td><td>/users(.:format)</td><td>devise/registrations#create</td></tr>

<tr><td>new_user_registration</td><td>GET</td><td>/users/sign_up(.:format)</td><td>devise/registrations#new</td></tr>

<tr><td>edit_user_registration</td><td>GET</td><td>/users/edit(.:format)</td><td>devise/registrations#edit</td></tr>

<tr><td></td><td>PATCH</td><td>/users(.:format)</td><td>devise/registrations#update</td></tr>

<tr><td></td><td>PUT</td><td>/users(.:format)</td><td>devise/registrations#update</td></tr>

<tr><td></td><td>DELETE</td><td>/users(.:format)</td><td>devise/registrations#destroy</td></tr>
</tbody>
</table>

#### Lets Look at the migrations file.
open db/migrate/...

Notice that some fields are commented out. This is because they are _ONLY_ needed by certain devise models.

In this case confirmation and lockout features of Devise are not being used. But, they may be in the future. If so, create migrations to add these attributes.

#### Lets Look at the User model.
We're using a couple of devise modules. See Devise Modules below.

## Startup the app.
	`rails s -p 3333`

## Add the Devise views to your app.
	`rails g devise:views`
	
This will copy the views that are typically in the Devise gem to your app. Then you can modify these views as needed.

Lets look at a couple of these.


## Devise Modules
* database-authenticatable  	Handles authentication of a user, as well as password encryption.
* confirmable  	Adds the ability to require email confirmation of user accounts.
*lockable  	Can lock an account after n number of failed login attempts. recoverable Provides password reset functionality.
* registerable  	Alters user sign up to be handled in a registration process, along with account management.* rememberable  	Provides remember me functionality. 
* timeoutable  	Allows sessions to be expired in a configurable time frame.* trackable:	Stores login counts, timestamps, and IP addresses.* validatable	Adds customizable validations to email and password.* omniauthable	Adds Omniauth2 support

### References


