code_snippets.rb

From new page

<%= form_for @adventure do |f| %>
    <%= f.fields_for :pages, @adventure.pages.build do |p| %>
        <%= p.text_field :name, placeholder: "Page Title" %><br>
        <%= p.text_area :text, placeholder: "Story Text" %><br>
    <% end %>
    <%= f.submit %>
<% end %>