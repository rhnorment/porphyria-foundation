Feature: List blog posts

  Background:
    Given the following posts:
      | admin_user_id |  body  | image     | intro   | published | published_at | title   |
      |       1       | Body 1 | image.jpg | Intro 1 | true      | 10-10-10     | Title 1 |
      |       1       | Body 2 |           | Intro 2 | true      | 11-11-11     | Title 2 |
      |       1       | Body 3 | image.jpg | Intro 3 | false     |              | Title 3 |


  Scenario: List all published posts
    When I visit the posts page
    Then I should see "Title 1"
    And I should see "Title 2"
    And I should see "Admin User Name"
    And I should not see "Title 3"
    And I should see link "Read more"
    And I should see link "October 2010"
    And I should see link "November 2011"

  Scenario: List posts published in a specific month



