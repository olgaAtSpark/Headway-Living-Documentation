@P1
Feature: Invite new employee and offer
    "**As** a Manager "
    "**I want** to be able to invite new employees with an offer letter "
    "**So that** they can be onboarded"

  Scenario: Invite a new employee - Filling out the required fields only
    Given I logged in as a manager
    And the Offer Letter page is opened
    And '+Create Offer' tab is opened
    When I look up an employee
    And there aren't employees who meet the search criteria
    Then I see the message 'No record of this employee' and 'Invite New Employee' button
    When I click 'Invite New Employee' button
    Then a two-step form is displayed
    When I populate Email Address, Position, Work Location, Start Date, Pay Rate with valid data
    And I click Submit Offer
    Then I see the confirmation pop-up 'Are you sure you want to send an offer letter?'
    When I click 'Confirm'
    Then I see a message 'Offer letter was successfully sent'

  Scenario: Invite a new employee - Filling out all fields
    Given I logged in as a manager
    And the Offer Letter page is opened
    And '+Create Offer' tab is opened
    When I look up an employee
    And there aren't employees who meet the search criteria
    Then I see the message 'No record of this employee' and 'Invite New Employee' button
    When I click 'Invite New Employee' button
    Then a two-step form is displayed
    When I populate all fields with valid data
    And I click Submit Offer
    Then I see the confirmation pop-up 'Are you sure you want to send an offer letter?'
    When I click 'Confirm'
    Then I see a message 'Offer letter was successfully sent'

  Scenario: Invite a new employee - Filling out non-required fields
    Given I logged in as a manager
    And the Offer Letter page is opened
    And '+Create Offer' tab is opened
    When I look up an employee
    And there aren't employees who meet the search criteria
    Then I see the message 'No record of this employee' and 'Invite New Employee' button
    When I click 'Invite New Employee' button
    Then a two-step form is displayed
    When I populate all non-required fields with valid data
    And I click Submit Offer
    Then I see that the required fields are highlighted and indicated as 'Required'
    And Offer is not created

  Scenario Outline: Pay Rate
    Given the Offer Letter page is opened
    And two-step form is opened
    And the required fields except 'Pay Rate' are filled
    When I enter "<pay_rate>"
    Then I see "<result>"

    Examples:
      | pay_rate | result |
      | $0.00 | the message Pay Rate should be more than 0 |
      | $100.00 | that Pay Rate applied |
      | $250.30 | that Pay Rate applied |
      | $10,000.00 | that Pay Rate applied |
      | $25,000.00 | the maximum amount is $10,000.00 |

  Scenario: Cancel Offer creation
    Given the Offer Letter page is opened
    And two-step form is opened
    When I filling out all fields
    And click 'Cancel'
    Then Invite & Create Offer form is displayed
    And Offer is not created
