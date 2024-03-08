Feature: Change the title of a task
    As a user
    I want to change the title of a task
    So that I can update the task's details

# Normal flow:
Scenario Outline: Change task title
    Given I have a task with the title "<old_title>"
    When I change the title to "<new_title>"
    Then the task title should be "<new_title>"

    Examples:
        | id | donestatus | title   | description | new_title |
        | 1  | False      | PAPAPA  | PAPAPA1     | PAPAPA5   |
        | 2  | True       | POPOPO  | POPOPOP2    | POPOPOP6  |
        | 3  | False      | PIPIPI  | PIPIP4      | PIPIP47   |

# Alternative flow:
Scenario Outline: change task title to the same one
    Given I have a task with the title "<old_title>"
    When I remove the title
    Then the task title should be "<old_title>"

    Examples:
        | id | donestatus | title   | description | new_title |
        | 1  | False      | PAPAPA  | PAPAPA1     | PAPAPA    |
        | 2  | True       | POPOPO  | POPOPOP2    | POPOPO    |
        | 3  | False      | PIPIPI  | PIPIP4      | PIPIPI    |

# Error flow:
Scenario Outline: Change the title for a task that doesn't exist
    Given I have a task with the title "<old_title>"
    When I change the title to "<new_title>"
    Then I should see an error message

    Examples:
        | id | donestatus | title   | description | new_title |
        | 1  | False      | PAPAPA  | PAPAPA1     | PAPAPA1   |
        | 2  | True       | POPOPO  | PAPAPA1     | PAPAPA1   |
        | 3  | False      | PIPIPI  | PIPIP4      | PIPIP4    |