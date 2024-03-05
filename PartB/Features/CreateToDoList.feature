
Feature: Create  a todo list for a class 

    As a student, I want to create a todo list for a class so that I can keep track of my assignments and due dates.
##Normal Flow : 
Scenario Outline: Create a todo list for a class
    Given that there is no project with the name "<project_name>" and description "<project_description>" with complete status "<complete_status>" and active status "<project_status>" in the system
    When I create a new project with the name "<project_name>" and description "<project_description>" with complete status "<complete_status>" and active status "<project_status>"
    Then the project with the name "<project_name>" and description "<project_description>" with complete status "<complete_status>" and active status "<project_status>" should be created in the system
    
    Examples:
    | project_name | project_description | complete_status | project_status |
    | Math         | Math Homework       | No              | Yes            |
    | Science      | Science Homework    | No              | Yes            |

##Alternative flow :
Scenario Outline : Create an inactive and completed project
    Given that there is no project with the name "<project_name>" and description "<project_description>" with complete status "<complete_status>" and active status "<project_status>" in the system
    When I create a new project with the name "<project_name>" and description "<project_description>" with complete status "<complete_status>" and active status "<project_status>"
    Then the project with the name "<project_name>" and description "<project_description>" with complete status "<complete_status>" and active status "<project_status>" should be created in the system
    
    Examples:
    | project_name | project_description | complete_status | project_status |
    | Math         | Math Homework       | Yes             | No             |
    | Science      | Science Homework    | Yes             | No             |




##Error Flow :
Scenario Outline: Create a todo list for a class
    Given that there is a project with the name "<project_name>" and description "<project_description>" with complete status "<complete_status>" and active status "<project_status>" in the system
    When I create a new project with the name "<project_name>" and description "<project_description>" with complete status "<complete_status>" and active status "<project_status>"
    Then the system should display an error message "<error_message>"
    
    Examples:
    | project_name | project_description | complete_status | project_status | error_message |
    | Math         | Math Homework       | No              | Yes            | Project already exists |
    | Science      | Science Homework    | No              | Yes            | Project already exists |