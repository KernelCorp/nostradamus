Given(/^a visible category with name: "(.*?)"$/) do |name|
  category = Category.create name: name, is_visible: true
  category.update_attributes!
end

And (/^an invisible category with name: "(.*?)"$/) do |name|
  category = Category.create name: name, is_visible: false
  category.update_attributes!
end

Then (/^I should see the category "(.*?)"$/) do |name|
  page.should have_content(name)
end

But (/^I shouldn't see the category "(.*?)"$/) do |name|
  page.should have_no_content(name)
end



