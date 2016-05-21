module PorphyriaWorld
  def create_admin_user
    AdminUser.create!(
        {
            email:  'admin@example.com',
            password:   'password',
            password_confirmation:  'password',
            name:  'Admin User Name',
            bio:  'I am an Admin User an this is my bio.'
        }
    )
  end

  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_')).to_sym
      rescue Object => e
        raise "Can't fine mappying from \"#{page_name}\" to a page.\n" +
            "Now, go add a mapping in #{__FILE__}"
      end
    end
  end
end

World(PorphyriaWorld)