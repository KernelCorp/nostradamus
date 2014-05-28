Feature: Questions
  Show questions in a category. Send answer. Add new question

  Background:
    Given a category with name: "Ukraine"
      And a question in the category "Ukraine" with text: "Is who does not jump Moskal?"

  Scenario: Show questions
    When I go to "/"
     And I click on the category "Ukraine"
    Then I should see question: "Is who does not jump Moskal?"

  Scenario: Answer
    Given I signed in as user
    When I go to "/"
     And I click on the category "Ukraine"
     And I answer "No"
    Then I should see question: "Is who does not jump Moskal?"
     And I should see text "Вы ответили нет"
     And I should statistics
     But I shouldn't see a form for answer for the question "Is who does not jump Moskal?"

  Scenario: Create question
    Given a user with email: "ya.witek@tsar.ua", account: 9998
      And I signed in as user with email: "ya.witek@tsar.ua"
    When I go to '/ukraine/questions/new'
     And I fill up the input "Text"  as "Where is my baton?"
     And I submit the form "new_question"
    Then I should see question: "Is who does not jump Moskal?"
     And I should see question: "Where is my baton?"

  Scenario: Owner close question
    Given a user with email: "ya.witek@tsar.ua", account: 9998
      And a question in the category "Ukraine" with text: "Am I legitimacy"
      And I signed in as user with email: "ya.witek@tsar.ua"
    When I go to "/"
     And I click on the category "Ukraine"
     And I Click on th close button with answer "True" for question: "Am I legitimacy"
    Then I should see the close question "Am I legitimacy"
     And I should see right answer - "Да" for the question: "Am I legitimacy"

