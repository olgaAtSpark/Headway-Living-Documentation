@P2
Feature: Receive Offer Letter
    "As an employee"
    "I want to receive on after letter email when the manager submits it"
    "So that I can progress with accepting or rejecting it"

  Scenario: Employee receives an offer letter
    Given I am an employee
    When a manager creates an offer
    Then Offer Letter is sent
    When I open the email
    Then I can view offer letter
    And Or I can register
