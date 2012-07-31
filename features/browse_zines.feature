Feature: Browse Zines
  As a person
  In order to subvert the government
  I want to browse some anarchist zines

  Scenario: They are watching
    Given there is some subversive shit out there
    When I engage in subversive activity
    Then I should see subversive zines

  Scenario: Time is running out
    Given there is a lot of subversive shit out there
    When I engage in subversive activity
    Then the subversive shit should be ordered by date

  Scenario: Credit where credit is due
    Given there are many anarchists
    And they author some zines
    When I engage in subversive activity
    Then the zinarchists should get credit for being awesome

  Scenario: We need (a little) information
    Given there is a zine with lots of info
    When I engage in subversive activity
    Then I should see a summary

  Scenario: We need some more information
    Given there is a zine with lots of info
    When I engage in subversive activity
    And I click on the first zine link
    Then I should see a lot of text
