# README

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Testing specifications for posts:
    
    title: string
    description: text
    issue_type: enum -  issue, enhancement, feature
    priority: enum -  low, medium, high
    status: enum - open, closed, monitor

 - title must be present
 - title must be between 5 and 80 characters
 - description must be present
 - description must be between 20 and 600 characters
 - issue_type must be valid
 - priority must be valid
 - status must be valid