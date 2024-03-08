Feature: Create a new category

    As a user, I want to create a new category with an ID, description, and title.
#normal flow
    Scenario Outline: Create a new category
        Given that there is no category with the ID "<id>", description "<description>", and title "<title>" in the system
        When I create a new category with the ID "<id>", description "<description>", and title "<title>"
        Then the category with the ID "<id>", description "<description>", and title "<title>" should be created in the system

        Examples:
            | id | description       | title         |
            | 1  | Category 1        | Category One  |
            | 2  | Category 2        | Category Two  |
#error flow

    Scenario Outline: Create a category that already exists
        Given that there is a category with the ID "<id>", description "<description>", and title "<title>" in the system
        When I create a new category with the ID "<id>", description "<description>", and title "<title>"
        Then the system should display an error message "<error_message>"

        Examples:
            | id | description       | title         | error_message           |
            | 1  | Category 1        | Category One  | Category already exists |
            | 2  | Category 2        | Category Two  | Category already exists |