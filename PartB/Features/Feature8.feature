Feature: Change the title for a project item

    As a student, I want to change the title for a project item so that I can manage my tasks effectively.

#NORMAL FLOW
    Scenario Outline: Change title for a project item
        Given I have a project item with the title "<project_title>" and id "<project_id>"
        When I change the title for the project item to "<new_project_title>"
        Then the title for the project item is updated to "<new_project_title>"
        Example: 
            | project_id | project_title | project_completed | project_active | new_project_title | project_description |
            | 1          | Math          | False             | True           | newMath             | Mathgsssss          |
            | 2          | Science       | False             | True           | new_science             | ScienceRocks        |

#ALTERNATE FLOW
    Scenario Outline: Change title to the same status for a project item
        Given I have a project item with the title "<project_title>" and id "<project_id>"
        When I change the title for the project item to "<project_title>"
        And I change the project title to "<project_title>"
        Then the title for the project item is not updated
        Example: 
            | project_id | project_title | project_completed | project_active | new_project_title | project_description |
            | 1          | Math          | False             | True           | Math              | Mathgsssss          |
            | 2          | Science       | False             | True           | Science              | ScienceRocks        |

#ERROR FLOW
    Scenario Outline: Change title for a non-existing project item
        Given a non-existing project item with the title "<project_title>" and id "<project_id>"
        When I change the title for the project item to "<project_active>"
        And I change the project title to "<new_project_title>"
        Then an error message is displayed indicating that the project item does not exist
        Example: 
            | project_id | project_title | project_completed | project_active | new_project_title | project_description |
            | 1          | Math          | False             | True           | Math        | Mathgsssss          |
            | 2          | Science       | False             | True           | Science      | ScienceRocks        |
