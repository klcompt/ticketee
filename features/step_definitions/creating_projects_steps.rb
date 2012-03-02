Given /^I am on the homepage$/ do
  visit root_path
end

When /^I follow "([^\"]*)"$/ do |name|
  click_link name
end

When /^I fill in "Name" with "TextMate 2"$/ do
  fill_in 'Name', :with => 'TextMate 2'
end

When /^I press "Create Project"$/ do
  click_button "Create Project"
end

Then /the project page for "([^\"]*)"$/ do |name|
  current_url == project_path(Project.find_by_name!(name))
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end
