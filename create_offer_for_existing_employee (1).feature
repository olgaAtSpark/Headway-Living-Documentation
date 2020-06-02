@P1
Feature: Create Offer for existing employee
    As a Manager
    I want to create an offer for existing employees
    So that they can be onboarded

  Scenario: Create Offer - Existing employee
    Given I logged in as a manager
    And the Offer Letter page is opened
    And '+Create Offer' tab is opened
    When I found an existing employee
    Then I see 'Create Offer' button for him
    When I click 'Create Offer'
    Then 'Create Offer - [Last Name, First Name]' form is opened
    And I see an email and ID
    When I select a position, work location, start date and fill the pay rate with valid data
    And click 'Submit Offer'
    Then I see a confirmation pop-up 'Are you sure you want to send an offer letter?'
    When I click 'Confirm'
    Then I see the notification '[First name Last name]'s offer letter was successfully sent.'
    And 'Outstanding' tab is opened

  Scenario Outline: Pay Rate control
    Given the Offer Letter page is opened
    And 'Create Offer - [Last Name, First Name]' form is opened
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

  Scenario: Cancel Offer creation for existing employee
    Given the Offer Letter page is opened
    And 'Create Offer - [Last Name, First Name]' form is opened
    When I filling out all fields
    And click 'Cancel'
    Then Create Offer form is closed
    And Offer is not created

  Scenario: Create Offer for one employee many times
    Given as a Manager
    And the Offer Letter page is opened
    And '+Create Offer' tab is opened
    When I create offer for an employee who already has another offer
    Then Offer is created
    And I can create offers for one employee many times
