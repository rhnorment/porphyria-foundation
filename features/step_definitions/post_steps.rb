Given(/^the following posts:$/) do |table|
  create_admin_user

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

Given(/^I am on (.+)$/) do |page_name|
  visit path_to(page_name)
end

When(/^I visit (.+)$/) do |page_name|
  visit path_to(page_name)
end

Then(/^I should see "([^\"]*)"$/) do |text|
  expect(page).to have_text(text)
end

Then(/^I should not see "([^\"]*)"$/) do |text|
  expect(page).to_not have_text(text)
end

Then(/^I should see link "([^\"]*)"$/) do |link|
  expect(page).to have_link(link)
end
