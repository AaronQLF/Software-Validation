Feature: Remove a todo list for a class

    As a student, I want to remove a todo list for a class so that I can keep my todo list up to date.

##Normal Flow : 
Scenario Outline: Remove a todo list for a class
    Given I have a todo list for a class
    When I remove the todo list for the class
    Then the todo list for the class is removed from my todo list
    Example: 
      | project_title | project_completed | project_active | project_description        |
      | Math          | False             | True           | Mathgsssss                 |
      | Science       | False             | True           | ScienceRocks               |

##Alternative Flow :
Scenario Outline: Remove an empty todo list for a class
    Given I have an empty todo list for a class
    When I remove the todo list for the class
    Then the todo list for the class is removed from my todo list
    Example: 
      | project_title | project_completed | project_active | project_description        |
      | Math          | False             | True           | Mathgsssss                 |
      | Science       | False             | True           | ScienceRocks               |

##Error Flow:
Scenario Outline: Remove a todo list for a class that does not exist
    Given a non existing project
    When I remove the todo list for a class that does not exist
    Then the todo list for the class is not removed from my todo list
    Example: 
      | project_title | project_completed | project_active | project_description        |
      | Math          | False             | True           | Mathgsssss                 |
      | Science       | False             | True           | ScienceRocks               |
