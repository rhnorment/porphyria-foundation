# TABLES
Given(/^the following posts:$/) do |table|
  create_admin_user

  create_posts(table)
end

Given(/^the following tags:$/) do |table|
  create_tags(table)
end

Given(/^the following taggings:$/) do |table|
  create_taggings(table)
end

# PATHS
Given(/^I am on (.+)$/) do |page_name|
  visit path_to(page_name)
end

When(/^I visit (.+)$/) do |page_name|
  visit path_to(page_name)
end

Then(/^I should be on (.+)$/) do |page_name|
  expect(current_path).to eql(path_to(page_name))
end

# ACTIONS
When(/^I click "([^\"]*)"$/) do |link|
  click_link(link)
end

# SEE OR NOT SEE
Then(/^I should see "([^\"]*)"$/) do |text|
  expect(page).to have_text(text)
end

Then(/^I should not see "([^\"]*)"$/) do |text|
  expect(page).to_not have_text(text)
end

Then(/^I should see the link "([^\"]*)"$/) do |link|
  expect(page).to have_link(link)
end

Then(/^I should not see the link "([^\"]*)"$/) do |link|
  expect(page).to_not have_link(link)
end

Then(/^The page should have "([^\"]*)" message "([^\"]*)"$/) do | element, text|
  expect(page).to have_css("#{element}", text: text, visible: true)
end
