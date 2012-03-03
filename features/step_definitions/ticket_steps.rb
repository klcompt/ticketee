Given /^"([^"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge!(:user => User.find_by_email!(email))
    @project.tickets.create!(attributes)
  end
end

Then /^I should see "([^"]*)" within "([^"]*)"$/ do |text, element|
  find(element).should have_content(text)
end

