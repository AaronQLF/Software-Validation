Feature: Prioritize Tasks according to Low, Medium, High, and Urgent

    As a student, I want to be able to prioritize my tasks according to their urgency so that I can manage my time effectively.

#normal flow 
Scenario Outline: Prioritize Tasks according to Low, Medium, High, and Urgent
    Given I have a task to do
    When I prioritize the task as <priority>
    Then the task should be added to the list of tasks with the priority <priority>

    Examples:
            | task_title  | task_description | task_doneStatus | category_title| category_description |
            | write essay | essay #4         | False           | LOW           | low priority         |
            | read paper  | paper #3         | True            | MEDIUM        | medium priority      |
            | project 1   | class #4         | False           | HIGH          | high priority        | 
            | project 2   | class #5         | True            | URGENT        | urgent priority      |

#alternative flow
Scenario: Prioritize Tasks according to Low, Medium, High, and Urgent
    Given I have a task to do
    When I prioritize the task as <priority>
    Then the task should be added to the list of tasks with the priority <priority>
    And I should be able to see the list of tasks with the priority <priority>

    Examples:
            | task_title  | task_description | task_doneStatus | category_title| category_description |
            | write essay | essay #4         | False           | LOW           | low priority         |
            | read paper  | paper #3         | True            | MEDIUM        | medium priority      |
            | project 1   | class #4         | False           | HIGH          | high priority        | 
            | project 2   | class #5         | True            | URGENT        | urgent priority      |

#error flow
Scenario Outline: Prioritize a task with invalid priority
    Given I have a task to do
    When I prioritize the task as <priority>
    Then I should see an error message

    Examples:
            | task_title  | task_description | task_doneStatus | category_title| category_description |
            | write essay | essay #4         | False           | LOW           | low priority         |
            | read paper  | paper #3         | True            | MEDIUM        | medium priority      |
            | project 1   | class #4         | False           | HIGH          | high priority        | 
            | project 2   | class #5         | True            | URGENT        | urgent priority      |
            | project 3   | class #6         | False           | INVALID       | invalid priority      |