Given /^a user with email: "(.*?)", account: (.*?)$/ do |email, account|
  user = User.find_or_create_by(email: email)
  user.update_attributes password: 'password', account: account
end

Given /^I signed in as user with email: "(.*?)"$/ do |email|
  User.find_or_create_by(email: email, password: 'password')

  visit '/users/sign_in'
  within '#new_user' do
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: 'password'
  end
  find('[type=submit]').click
end

When /^I go to "(.*?)"$/ do |location|
  visit location[0] == '/' ? location : '/' << location
end

And (/^I click on the category "(.*?)"$/) do |name|
  find('#' + name).click
end

