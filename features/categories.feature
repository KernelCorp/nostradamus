Feature: Categories
  In order to show categories to users

  Scenario: Show visible categories
    Given a visible category with name: "cats"
      And an invisible category with name: "unicorns"
    When I go to "/"
    Then I should see the category "cats"
     But I shouldn't see the category "unicorns"