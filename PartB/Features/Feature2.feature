Feature: Remove a todo list for a class

  As a student, I want to remove a todo list for a class so that I can keep my todo list up to date.

  ## Normal Flow:

  Scenario Outline: Remove a todo from the list for a class
    Given I have a todo list for a class with the following entries:
      | id | donestatus | description   | title        |
      | 1  | false      | Mathgsssss    | Math         |
      | 2  | false      | ScienceRocks  | Science      |
    When I remove a todo with id <todo_id> from the list for the class
    Then the todo with id <todo_id> is removed from my todo list for the class

    Examples:
      | id | donestatus | description   | title        |
      | 1  | false      | Mathgsssss    | Math         |

  ## Alternative Flow:

  Scenario Outline: Remove a todo from an empty list for a class
    Given I have an empty todo list for a class
    When I remove a todo from the list for the class
    Then no todo is removed from my todo list for the class

  ## Error Flow:

  Scenario Outline: Remove a non-existing todo from the list for a class
    Given I have a todo list for a class with the following entries:
      | id | donestatus | description   | title        |
      | 1  | false      | Mathgsssss    | Math         |
      | 2  | false      | ScienceRocks  | Science      |
    When I remove a todo with id <todo_id> from the list for the class
    Then no todo is removed from my todo list for the class

    Examples:
      | todo_id |
      | 3       |
