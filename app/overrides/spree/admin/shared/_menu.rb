Deface::Override.new(
  :virtual_path => "spree/admin/shared/_menu",
  :name => "admin_content_admin_tab_parser",
  :insert_bottom => "[data-hook='admin_tabs']",
  :text => "<%= tab :affiliates,  :url => admin_affiliates_path, :icon => 'suitcase' %>",
  :disabled => false
)
