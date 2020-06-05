@P2
Feature: Review and Accept offer letter
    As an employee
    I want to be able to review the offer letter
    So that I can make a decision to accept or reject the offer

  Scenario: Review offer if the employee is not logged in to the app
    Given I am an employee
    And I am not logged in to the application
    And I received a new offer
    When I click 'View Offer Letter'
    Then Login page is opened
    When I log in
    Then Offer letter screen is opened
    And I can review my offer

  Scenario: Review offer if the employee is logged in to the app
    Given I logged in as an employee
    And I received a new offer
    When I click 'View offer letter'
    Then Offer letter screen is opened
    And I can review my offer

  Scenario: Accept offer
    Given I logged in as an employee
    And Offer Letter screen is opened
    When I click 'Accept'
    Then I move to the next step
    And status of the offer is outstanding

  Scenario: Review offer and close it
    Given I logged in as an employee
    And Offer Letter screen is opened
    When I review offer
    But I don't want to make a decision right now
    And I close offer
    Then I see 'Offers Letter' page
