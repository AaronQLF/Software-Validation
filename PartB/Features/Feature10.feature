Feature: Change active status for a project item

    As a student, I want to change the active status for a project item so that I can manage my tasks effectively.

#NORMAL FLOW
    Scenario Outline: Change active status for a project item
        Given I have a project item with the title "<project_title>" and id "<project_id>"
        When I change the active status for the project item to "<project_active>"
        Then the active status for the project item is updated to "<project_active_new>"
        Example: 
            | project_id | project_title | project_completed | project_active | project_active_new | project_description |
            | 1          | Math          | False             | True           | False              | Mathgsssss          |
            | 2          | Science       | False             | True           | False              | ScienceRocks        |

#ALTERNATE FLOW
    Scenario Outline: Change active status to the same status for a project item
        Given I have a project item with the title "<project_title>" and id "<project_id>"
        When I change the active status for the project item to "<project_active>"
        Then the active status for the project item is not updated
        Example: 
            | project_id | project_title | project_completed | project_active | project_active_new | project_description |
            | 1          | Math          | False             | True           | True               | Mathgsssss          |
            | 2          | Science       | False             | True           | True               | ScienceRocks        |

#ERROR FLOW
    Scenario Outline: Change active status for a non-existing project item
        Given a non-existing project item with the title "<project_title>" and id "<project_id>"
        When I change the active status for the project item to "<project_active>"
        Then an error message is displayed indicating that the project item does not exist
        Example: 
            | project_id | project_title | project_completed | project_active | project_description |
            | 1          | Math          | False             | True           | Mathgsssss          |
            | 2          | Science       | False             | True           | ScienceRocks        |
