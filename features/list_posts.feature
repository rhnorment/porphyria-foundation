Feature: List blog posts

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

  Scenario: List all published posts
    When I visit the posts page

    And I should see "Title 1"
    And I should see "Title 2"
    And I should see "Admin User Name"
    And I should not see "Title 3"

    And I should see the link "Read more"
    And I should see the link "October 2010"
    And I should see the link "November 2011"

    And I should see the link "General"
    And I should see the link "Support"
    And I should not see the link "Disease"

  Scenario: List posts published in a specific month
    When I am on the posts page
    And I click "October 2010"

    Then The page should have "h5" message "Showing posts for October 2010"

    Then I should see "Title 1"
    And I should not see "Title 2"
    And I should not see "Title 3"

  Scenario: List published posts associated with a specified tag
    When I am on the posts page
    And I click "General"

    Then The page should have "h5" message "Showing posts for General"

    And I should see "Title 1"
    And I should see "Admin User Name"

    And I should not see "Title 2"
    And I should not see "Title 3"




