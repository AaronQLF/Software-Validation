Feature: Change priority of a task
    As a user, I want to be able to change the priority of a task so that I can more accurately prioritize my tasks.
#normal flow:
Scenario Outline: Change priority to a higher priority
    Given I have a task with a priority of <priority>
    When I change the priority to a higher priority
    Then the task should have a priority of <new_priority>

    Examples:
        | task_title  | task_description | task_doneStatus | category_title| category_description | new_category_title | new_category_description |
        | write essay | essay #4         | False           | LOW           | low priority         | HIGH               | high priority            |
        | read paper  | paper #3         | True            | LOW           | low priority         | HIGH               | high priority           |
        | project 1   | class #4         | False           | LOW           | low priority         | HIGH               | high priority            |

#Alternative Flow :
Scenario Outline: Change priority to a lower priority
    Given I have a task with a priority of <priority>
    When I change the priority to a lower priority
    Then the task should have a priority of <new_priority>

    Examples:
        | task_title  | task_description | task_doneStatus | category_title| category_description | new_category_title | new_category_description |
        | write essay | essay #4         | False           | MEDIUM        | medium priority      | LOW               | low priority            |
        | read paper  | paper #3         | True            | MEDIUM        | medium priority      | LOW               | low priority            |
        | project 1   | class #4         | False           | HIGH          | high priority        | LOW               | low priority            |

#Error flow : 
Scenario Outline: Change priority to an invalid priority
    Given I have a task with a priority of <priority>
    When I change the priority to an invalid priority
    Then the task should have a priority of <new_priority>

    Examples:
        | task_title  | task_description | task_doneStatus | category_title| category_description | new_category_title | new_category_description |
        | write essay | essay #4         | False           | LOW           | low priority         | INVALID           | invalid priority        |
        | read paper  | paper #3         | True            | LOW           | low priority         | INVALID           | invalid priority        |
        | project 1   | class #4         | False           | LOW           | low priority         | INVALID           | invalid priority        |
```