@P2
Feature: View Offer Letter by status - Manager
    As a Manager
    I want to be able to quickly browse through letters by status
    So that I can make decisions quickly

  Scenario Outline: View offer by status
    Given I logged in as a manager
    And 'Offer Letter' page is opened
    When I click "<status_name>"
    Then I see offer letters
    But I know that list can be empty
    And I can make decisions quickly

    Examples:
      | status_name |
      | Outstanding |
      | Declined |
      | Accepted |
      | Expired |
      | Rescinded |
