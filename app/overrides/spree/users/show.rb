Deface::Override.new(
  :virtual_path => "spree/users/show",
  :name => "user_info",
  :insert_after => "[data-hook='account_summary'] #user-info dd:first"
) do
<<-CODE.chomp
<dt>Referral URL</dt>
<dd><input type='text' value='<%= referral_url(@user.referral.code) %>' onClick='this.select();' /></dd>
<dt>Referred Users Count</dt>
<dd><%= @user.referral_count%></dd>
CODE
end
Deface::Override.new(
  :virtual_path => "spree/users/show",
  :name => "user_account",
  :insert_after => "[data-hook='account_my_orders']"
) do
<<-CODE.chomp
<h3>Referral Information</h3>
<% if @user.referral_count > 0 %>
  <table>
    <thead>
    <tr>
      <th></th>
      <th>Email</th>
    </tr>
    </thead>
    <tbody>
      <% @user.referral.referred_users.sort_by(&:created_at).to_enum.with_index.reverse_each do |user, i| %>
        <tr class="<%= cycle('even', 'odd') %>">
          <td><%= i+1 %></td>
          <td><%= user.email %></td>
        </tr>
      <% end %>
    </tbody>
  </table>
<% else %>
  <p>No referred users yet.</p>
<% end %>
CODE
end
