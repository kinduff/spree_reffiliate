Deface::Override.new(
  :virtual_path => "spree/users/show",
  :name => "user_info",
  :insert_after => "[data-hook='account_summary'] #user-info dd:first"
) do
<<-CODE.chomp
<dt>Referral URL</dt>
<dd><input type='text' value='<%= referral_url(@user.referral.code) %>' onClick='this.select();' /></dd>
<dt>Referred Users</dt>
<dd><%= @user.referred_count%></dd>
CODE
end
