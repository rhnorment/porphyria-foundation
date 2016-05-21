Given(/^the following posts:$/) do |table|
  create_admin_user
  table.hashes.each do |hash|
    Post.create(hash)
  end
end

When(/^I visit (.+)$/) do |page_name|
  visit path_to(page_name)
end

Then(/^I should see the published posts$/) do
  within('#1') do
    expect(page).to have_text('Title 1')
    expect(page).to have_image?('image.jpg')
  end

  within('#2') do
    expect(page).to have_text('Title 2')
  end

  within('#3') do
    expect(page).to have_text('Title 3')
  end
end

Then(/^I should not see the unpublished posts$/) do
  expect(page).to_not have_text('Title 4')
end

Then(/^The images should render properly$/) do

end
