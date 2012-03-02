Given /^I am on the homepage$/ do
  visit root_path
end

When /^I follow "([^\"]*)"$/ do |name|
  click_link name
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |name, value|
  fill_in name, :with => value
end

When /^I press "([^\"]*)"$/ do |but_value|
  click_button but_value
end

Then /the project page for "([^\"]*)"$/ do |name|
  current_url == project_path(Project.find_by_name!(name))
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end
