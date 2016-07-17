ActiveAdmin.setup do |config|
 config.site_title = 'American Porphyria Foundation'

 config.site_title_link = "/"

 # config.site_title_image = "logo.png"

 config.authentication_method = :authenticate_admin_user!

 config.current_user_method = :current_admin_user

 config.logout_link_path = :destroy_admin_user_session_path

 # config.logout_link_method = :get

 # config.root_to = 'dashboard#index'

 # config.comments_order = 'created_at ASC'

 config.batch_actions = true

 config.localize_format = :long

 # config.breadcrumb = false

   # == CSV options
  #
  # Set the CSV builder separator
  # config.csv_options = { col_sep: ';' }
  #
  # Force the use of quotes
  # config.csv_options = { force_quotes: true }

  # == Menu System
  #
  # You can add a navigation menu to be used in your application, or configure a provided menu
  #
  # To change the default utility navigation to show a link to your website & a logout btn
  #
  #   config.namespace :admin do |admin|
  #     admin.build_menu :utility_navigation do |menu|
  #       menu.add label: "My Great Website", url: "http://www.mygreatwebsite.com", html_options: { target: :blank }
  #       admin.add_logout_button_to_menu menu
  #     end
  #   end
  #
  # If you wanted to add a static menu item to the default menu provided:

  config.namespace :admin do |admin|
    admin.build_menu  do |menu|
      menu.add label: 'Site Content', priority: 3
    end
  end

  # == Download Links
  #
  # You can disable download links on resource listing pages,
  # or customize the formats shown per namespace/globally
  #
  # To disable/customize for the :admin namespace:
  config.download_links = [:csv, :json, :xls]  
  
  
  # == Pagination
  #
  # Pagination is enabled by default for all resources.
  # You can control the default per page count for all resources here.
  #
  config.default_per_page = 100
  #
  # You can control the max per page count too.
  #
  # config.max_per_page = 10_000

  # == Filters
  #
  # By default the index screen includes a "Filters" sidebar on the right
  # hand side with a filter for each attribute of the registered model.
  # You can enable or disable them for all resources here.
  #
  # config.filters = true
end

