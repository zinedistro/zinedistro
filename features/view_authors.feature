Feature: As a site user, I should be able to view zine authors
  As a zinarchist
  In order to give credit to zine authors
  I want to be able to add authors

  Scenario: Viewing an authors
    Given there are 2 authors
    And the first author has published zines
    And the last author has unpublished zines
    When I view the authors page
    Then I should see the first author listed
    And I should not see the last author listed

  Scenario: Viewing all zines by an author
    Given there is an author
    And the first author has published zines
    When I view the authors page
    And I click on the first author link
    Then I should see the first author's zines

