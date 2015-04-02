Given(/^I am on the homepage$/) do
  visit "/"
end

When(/^I follow "([^"]*)"$/) do |link|
  click_link link
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end

Given(/^I am on the new game page$/) do
  visit '/new_page'
end

When(/^I type in "([^"]*)" with "([^"]*)"$/) do |field, name|
  fill_in(field, :with => name)
  fill_in(field, :with => "")
end

When(/^I click "([^"]*)"$/) do |button|
  click_button button
end


When(/^I type in "([^"]*)" with nil$/) do |field|
  fill_in(field, :with => "")
end

Then(/^I should see the new game page$/) do
  expect(page).to have_content('table')
end
