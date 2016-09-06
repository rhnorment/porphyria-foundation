Feature: Show post

  Background:
    Given the following posts:
      | admin_user_id |  body  | image     | intro   | published | published_at | title   |
      |       1       | Body 1 | image.jpg | Intro 1 | true      | 10-10-10     | Title 1 |
      |       1       | Body 2 |           | Intro 2 | true      | 11-11-11     | Title 2 |
      |       1       | Body 3 | image.jpg | Intro 3 | false     |              | Title 3 |

    And the following tags:
      | name | General | Disease | Support |

    And the following taggings:
      | post_id | tag_id |
      |    1    |    1   |
      |    1    |    3   |

  Scenario: View Title 1 Post
    When I visit the posts page
    And I click "Title 1"

    Then I should see "Title 1"
    And I should not see "Title 2"
    And I should not see "Title 3"

  Scenario: View Title 2 Post
    When I visit the posts page
    And I click "Title 2"

    Then I should see "Title 2"
    And I should not see "Title 1"
    And I should not see "Title 3"

