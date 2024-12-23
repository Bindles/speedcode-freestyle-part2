
<%# if current_user.admin? || current_user == tweet.user %>
  <%= turbo_frame_tag :bung do %>
    WORKED
    <% if current_user == @tweet.user %>
    <%= link_to 'Delete', @tweet, data: { turbo_confirm: 'Are you sure?', turbo_method: :delete } %>
  <% end %>

<% end %>