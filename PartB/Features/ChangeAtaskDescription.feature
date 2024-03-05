Feature: Change the description of a task
    As a user
    I want to change the description of a task
    So that I can update the task's details

#normal flow:
Scenario Outline: change task description
    Given I have a task with the description "<old_description>"
    When I change the description to "<new_description>"
    Then the task description should be "<new_description>"

    Examples:
        | task_title  | task_description | task_doneStatus | new_task_description |
        | PAPAPA    | PAPAPA1       | False           | PAPAPA5        |
        | POPOPO    | POPOPOP2      | True            | POPOPOP6       |
        | PIPIPI    | PIPIP4        | False           | PIPIP47        |

#alternative flow 
Scenario Outline: Remove Task description
    Given I have a task with the description "<old_description>"
    When I remove the description
    Then the task description should be "<new_description>"

    Examples:
        | task_title  | task_description | task_doneStatus | new_task_description |
        | PAPAPA    | PAPAPA1       | False           |        |
        | POPOPO    | POPOPOP2      | True            |        |
        | PIPIPI    | PIPIP4        | False           |        |

#error flow : 
Scenario Outline: Change the description for a task that doesn't exist
    Given I have a task with the description "<old_description>"
    When I change the description to "<new_description>"
    Then I should see an error message

    Examples:
        | task_title  | task_description | task_doneStatus | new_task_description |
        | PAPAPA    | PAPAPA1       | False           | PAPAPA1        |
        | POPOPO    | PAPAPA1      | True            | PAPAPA1       |
        | PIPIPI    | PIPIP4        | False           | PIPIP4        |