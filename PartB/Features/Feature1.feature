Feature: Change the description of a task
    As a user
    I want to change the description of a task
    So that I can update the task's details

# Normal flow:
Scenario Outline: Change task description
    Given I have a task with the title "<title>"
    When I change the description to "<new_description>"
    Then the task description should be "<new_description>"

    Examples:
        | id | donestatus | title   | description | new_description |
        | 1  | False      | PAPAPA  | PAPAPA1     | PAPAPA5         |
        | 2  | True       | POPOPO  | POPOPOP2    | POPOPOP6        |
        | 3  | False      | PIPIPI  | PIPIP4      | PIPIP47         |

# Alternative flow:
Scenario Outline: Change task description to the same one
    Given I have a task with the title "<title>"
    When I remove the description
    Then the task description should be "<description>"

    Examples:
        | id | donestatus | title   | description | new_description |
        | 1  | False      | PAPAPA  | PAPAPA1     |                 |
        | 2  | True       | POPOPO  | POPOPOP2    |                 |
        | 3  | False      | PIPIPI  | PIPIP4      |                 |

# Error flow:
Scenario Outline: Change the description for a task that doesn't exist
    Given I have a task with the title "<title>"
    When I change the description to "<new_description>"
    Then I should see an error message

    Examples:
        | id | donestatus | title   | description | new_description |
        | 1  | False      | PAPAPA  | PAPAPA1     | PAPAPA1         |
        | 2  | True       | POPOPO  | PAPAPA1     | PAPAPA1         |
        | 3  | False      | PIPIPI  | PIPIP4      | PIPIP4          |