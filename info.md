===============================================================================

Depending on your application's configuration some manual setup may be required:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

     * Required for all applications. *

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"
     
     * Not required for API-only Applications *

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

     * Not required for API-only Applications *

  4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views
       
     * Not required *

===============================================================================
rails generate scaffold Profile user:references bio:text avatar_url:string location:string

<script>
const filterVerhicles = () => {
const url = new Url(window.location.href);
url.searchParms.set('color', coducment.getElementById('filterColor').value;
url.searchParms.set('make', coducment.getElementById('filterMake').value;

fetch(url, {})
.then(response => response.text())
.then(text => {
docuemnt.getElementById('verhicleTable').innerHTML = text
window.history.pushState({}, '', url);
});


<div id="chat_messages" data-turbo-stream="replace" data-turbo-stream-from="chat_message_template"></div>
<template id="chat_message_template">
<% @posts.each do |message| %>
<p><%= message.content %></p>
<% end %>
</template>