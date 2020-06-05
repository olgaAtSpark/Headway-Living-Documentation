@P3
Feature: Reject offer letter view reason
    As an Employee
    I want to be able to reject offer letter with reason
    So that manager knows why I made the decision

  Scenario Outline: Reject offer
    Given I logged in as an employee
    And Offer Letter screen is opened
    When I want to reject offer
    And click 'Reject'
    Then I must choose a reject reason
    When I choose "<reason>"
    And click 'Reject'
    Then window is closed
    And I see offer with the selected reason

    Examples:
      | reason |
      | Incorrect pay rate |
      | Incorrect start date |
      | No longer interested |
      | Accepted another offer |

  Scenario: Cancel offer rejection
    Given I logged in as an employee
    And Offer Letter screen is opened
    When I click 'Reject'
    Then a window with the reasons for rejecting is opened
    When I decided that want to make a decision later
    And click 'Go Back'
    Then I see the offer letter screen
    And I can review my offer again
