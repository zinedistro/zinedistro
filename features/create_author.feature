Feature: Add Authors
  As a zinarchist
  In order to give credit to zine authors
  I want to be able to add authors

  Scenario: Viewing an author
    Given there is at least one author
    When I engage in subversive activity
    Then I should see the authors listed on the author page
