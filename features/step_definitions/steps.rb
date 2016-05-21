Given(/^the following posts:$/) do |table|
  create_admin_user
  table.hashes.each do |hash|
    Post.create(hash)
  end
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
