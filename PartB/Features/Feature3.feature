Feature: Create a todo list for a class

    As a student, I want to create a todo list for a class so that I can keep track of my assignments and due dates.

    Scenario Outline: Create a todo list for a class
        Given that there is no todo with the title "<title>", description "<description>", done status "<done_status>", and id "<id>" in the system
        When I create a new todo with the title "<title>", description "<description>", done status "<done_status>", and id "<id>"
        Then the todo with the title "<title>", description "<description>", done status "<done_status>", and id "<id>" should be created in the system

        Examples:
            | title         | description       | done_status | id  |
            | Math Homework | Do math problems  | No          | 1   |
            | Science       | Study for test    | No          | 2   |

    Scenario Outline: Create an inactive and completed todo
        Given that there is no todo with the title "<title>", description "<description>", done status "<done_status>", and id "<id>" in the system
        When I create a new todo with the title "<title>", description "<description>", done status "<done_status>", and id "<id>"
        Then the todo with the title "<title>", description "<description>", done status "<done_status>", and id "<id>" should be created in the system

        Examples:
            | title         | description       | done_status | id  |
            | Math Homework | Do math problems  | Yes         | 3   |
            | Science       | Study for test    | Yes         | 4   |

    Scenario Outline: Create a todo list for a class
        Given that there is a todo with the title "<title>", description "<description>", done status "<done_status>", and id "<id>" in the system
        When I create a new todo with the title "<title>", description "<description>", done status "<done_status>", and id "<id>"
        Then the system should display an error message "<error_message>"

        Examples:
            | title         | description       | done_status | id  | error_message           |
            | Math Homework | Do math problems  | No          | 1   | Todo already exists      |
            | Science       | Study for test    | No          | 2   | Todo already exists      |