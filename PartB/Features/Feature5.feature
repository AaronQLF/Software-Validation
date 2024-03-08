Feature: Change the done status of a task
    As a user
    I want to change the done status of a task
    So that I can update the task's completion status

# Normal flow:
Scenario Outline: Change task done status
    Given I have a task with the title "<title>"
    When I change the done status to "<new_done_status>"
    Then the task done status should be "<new_done_status>"

    Examples:
        | id | donestatus | title   | description | new_done_status |
        | 1  | False      | PAPAPA  | PAPAPA1     | True            |
        | 2  | True       | POPOPO  | POPOPOP2    | False           |
        | 3  | False      | PIPIPI  | PIPIP4      | True            |

# Alternative flow:
Scenario Outline: Change task done status to the same one
    Given I have a task with the title "<title>"
    When I remove the done status
    Then the task done status should be "<donestatus>"

    Examples:
        | id | donestatus | title   | description | new_done_status |
        | 1  | False      | PAPAPA  | PAPAPA1     | False           |
        | 2  | True       | POPOPO  | POPOPOP2    | True            |
        | 3  | False      | PIPIPI  | PIPIP4      | False           |

# Error flow:
Scenario Outline: Change the done status for a task that doesn't exist
    Given I have a task with the title "<title>"
    When I change the done status to "<new_done_status>"
    Then I should see an error message

    Examples:
        | id | donestatus | title   | description | new_done_status |
        | 1  | False      | PAPAPA  | PAPAPA1     | True            |
        | 2  | True       | POPOPO  | PAPAPA1     | False           |
        | 3  | False      | PIPIPI  | PIPIP4      | True            |