#encoding: utf-8

And (/^a question in the category "(.*?)" with text: "(.*?)"$/) do |cat_name, text|
  question = Question.new title: 'test question', text: text
  question.save!
  category = Category.find_or_create_by(name: cat_name)
  category.questions << question
end

Then (/^I should see question: "(.*?)"$/) do |text|
  page.should have_content(text)
end

And (/^I answer "(.*?)"$/) do |answer|
  page.choose('answer_value_0')
  find("input[value='OK']").click
end

And (/^I should see text "(.*?)"$/) do |text|
  page.should have_content(text)
end

And /^I should see statistics$/ do
  page.should have_css('.results')
end

But /^I shouldn't see a form for answer for the question "(.*?)"$/ do |text|
  page.should_not have_css('#new_answer')
end

And /^I fill up the input "(.*?)" as "(.*?)"$/ do |field, content|
  within '#new_question' do
    fill_in 'question[' + field + ']', with: content
  end
end

And /^I submit the form "(.*?)"$/ do |form|
  find('[type=submit]').click
end

And /^I click on the close button with answer "(.*?)" for question: "(.*?)"$/ do |answer, text|
  if answer == 'true'
    find('[type=submit]').click
  end
end

#TODO: Fix last steps
Then /^I should see the close question "(.*?)"$/ do |text|
  page.should have_css('.guessed')
end

And /^I should see right answer - "(.*?)" for the question: "(.*?)"$/ do |answer, text|
  page.should have_content('Правильный ответ - ' + answer)
end