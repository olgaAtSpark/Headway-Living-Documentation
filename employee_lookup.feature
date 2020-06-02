@P1
Feature: Employee lookup
    "In order to look up employees before extending an offer or taking any further actions"
    "As a Manager"
    "I want to be able to look up employees in the system"

  Scenario Outline: Lookup an existing employee by any of the fields
    As a manager
    I want to look up existing employees by any of the fields
    Given I logged in as a manager
    And Offer Letter page is opened
    When I click '+Create Offer'
    Then I see 'Invite or Lookup Employee'
    When I populate "<field_name>" with valid data
    And click 'Lookup'
    Then I see employees who meet the search criteria
    And I see the results in the table are only people who have received an offer letter in the past

    Examples:
      | field_name |
      | First Name |
      | Last Name |
      | Email Address |
      | Cell Phone Number |

  Scenario Outline: Lookup employee by any of the fields
    As a manager
    I want to look up an employee by any of the fields
    So if an employee is not found, I can invite him
    Given I logged in as a manager
    And Offer Letter page is opened
    When I click '+Create Offer'
    Then I see 'Invite or Lookup Employee'
    When I populate "<field_name>" with invalid data
    And click 'Lookup'
    Then I don't see employees who meet the search criteria
    But I see the message 'No record of this employee.' and 'Invite Employee' button

    Examples:
      | field_name |
      | First Name |
      | Last Name |
      | Email Address |
      | Cell Phone Numbers |

  Scenario: At least one field is required
    Given I logged in as a manager
    And Offer Letter page is opened
    When I click '+Create Offer'
    Then I see 'Invite or Lookup Employee'
    And 'Lookup' button is disabled
    When I populate any field
    Then 'Lookup' button is enabled

  Scenario Outline: A partial search
    As a manager
    I want not all fields to be required when I look up an employee
    So that I can use a partial search
    Given I logged in as a manager
    And Offer Letter page is opened
    When I click ' Create Offer'
    Then I see 'Invite or Lookup Employee'
    When I fill "<field_name>"
    And click 'Lookup'
    Then I see search results
    And don't need to fill all fields

    Examples:
      | field_name |
      | First Name |
      | Last Name |
      | Email Address |
      | Cell Phone Number |
