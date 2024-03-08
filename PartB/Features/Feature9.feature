Feature: Change the description of a category
    As a user
    I want to change the description of a category
    So that I can update the category's details

# Normal flow:
Scenario Outline: Change category description
    Given I have a category with the title "<title>"
    When I change the description to "<new_description>"
    Then the category description should be "<new_description>"

    Examples:
        | id | description | title   | new_description |
        | 1  | Category 1  | Title 1 | New Description |
        | 2  | Category 2  | Title 2 | New Description |
        | 3  | Category 3  | Title 3 | New Description |

# Alternative flow:
Scenario Outline: Change category description to an empty one
    Given I have a category with the title "<title>"
    When I remove the description
    Then the category description should be empty

    Examples:
        | id | description | title   | new_description |
        | 1  | Category 1  | Title 1 |                 |
        | 2  | Category 2  | Title 2 |                 |
        | 3  | Category 3  | Title 3 |                 |

# Error flow:
Scenario Outline: Change the description for a category that doesn't exist
    Given I have a category with the title "<title>"
    When I change the description to "<new_description>"
    Then I should see an error message

    Examples:
        | id | description | title   | new_description |
        | 1  | Category 1  | Title 1 | Description 1   |
        | 2  | Category 2  | Title 2 | Description 1   |
        | 3  | Category 3  | Title 3 | Description 3   |
