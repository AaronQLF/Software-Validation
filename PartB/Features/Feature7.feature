Feature: Change the title of a category
    As a user
    I want to change the title of a category
    So that I can update the category's details

# Normal flow:
Scenario Outline: Change category title
    Given I have a category with the title "<old_title>"
    When I change the title to "<new_title>"
    Then the category title should be "<new_title>"

    Examples:
        | id | description | title   | new_title |
        | 1  | Category 1  | Title 1 | New Title |
        | 2  | Category 2  | Title 2 | New Title |
        | 3  | Category 3  | Title 3 | New Title |

# Alternative flow:
Scenario Outline: Change category title to the same one
    Given I have a category with the title "<old_title>"
    When I remove the title
    Then the category title should be "<old_title>"

    Examples:
        | id | description | title   | new_title |
        | 1  | Category 1  | Title 1 |           |
        | 2  | Category 2  | Title 2 |           |
        | 3  | Category 3  | Title 3 |           |

# Error flow:
Scenario Outline: Change the title for a category that doesn't exist
    Given I have a category with the title "<old_title>"
    When I change the title to "<new_title>"
    Then I should see an error message

    Examples:
        | id | description | title   | new_title |
        | 1  | Category 1  | Title 1 | Title 1   |
        | 2  | Category 2  | Title 2 | Title 1   |
        | 3  | Category 3  | Title 3 | Title 3   |