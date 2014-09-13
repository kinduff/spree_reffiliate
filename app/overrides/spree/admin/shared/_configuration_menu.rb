Deface::Override.new(
  :virtual_path => "spree/admin/shared/_configuration_menu",
  :name => "admin_content_admin_configuration_menu_parser",
  :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
  :text => "<%= configurations_sidebar_menu_item Spree.t(:affiliates), admin_affiliates_path %>"
)
