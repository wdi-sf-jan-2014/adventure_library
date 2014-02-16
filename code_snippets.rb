code_snippets.rb

From adventure new page

<%= form_for @adventure do |f| %>
    <%= f.fields_for :pages, @adventure.pages.build do |p| %>
        <%= p.text_field :name, placeholder: "Page Title" %><br>
        <%= p.text_area :text, placeholder: "Story Text" %><br>
    <% end %>
    <%= f.submit %>
<% end %>

From library index

<%= form_for @library do |lib| %>
    <%= lib.text_field :url, placeholder: "Foreign Adventure URL" %><br>
    <%= lib.submit %>
<% end %>