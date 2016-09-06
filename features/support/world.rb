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

  def create_posts(table)
    table.hashes.each do |row|
      Post.create(
          admin_user_id: row['admin_user_id'],
          body: row['body'],
          image: row['image'],
          intro: row['intro'],
          published: row['published'],
          published_at: row['published_at'].blank? ? nil : Date.parse(row['published_at']),
          title: row['title'],
      )
    end
  end

  def create_tags(table)
    table.transpose.hashes.each do |row|
      Tag.create(row)
    end
  end

  def create_taggings(table)
    table.hashes.each do |row|
      Tagging.create(
          post_id: row['post_id'],
          tag_id: row['tag_id'],
      )
    end
  end
end

module Navigation
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

World(PorphyriaWorld, Navigation)