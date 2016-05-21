Feature: List blog items on index view

  Background:
    Given the following posts:
      | admin_user_id |  body  | image     | intro   | published | published_at | title   |
      |       1       | Body 1 | image.jpg | Intro 1 | true      | 10-10-10     | Title 1 |
      |       1       | Body 2 | image.jpg | Intro 2 | true      | 11-11-11     | Title 2 |
      |       1       | Body 3 |           | Intro 3 | true      | 12-12-12     | Title 3 |
      |       1       | Body 4 | image.jpg | Intro 4 | false     |              | Title 4 |


  Scenario: Viewing the post index
    When I visit the posts page
    Then I should see "Title 1"
    And I should see "Title 2"
    And I should see "Title 3"
    And I should not see "Title 4"


