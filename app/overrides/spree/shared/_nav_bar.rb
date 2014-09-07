Deface::Override.new(
  :virtual_path => "spree/shared/_nav_bar",
  :name => "referral_code_input",
  :insert_after => "#top-nav-bar #nav-bar li:nth-child(3)"
) do
<<-CODE.chomp
<% if spree_current_user %>
  <li id="referral-code-input"><input type='text' value='<%= referral_url(spree_current_user.referral.code) %>' onClick='this.select();' /></li>
<% end %>
CODE
end
