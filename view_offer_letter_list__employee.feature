@P3
Feature: View offer letter list - Employee
    As an employee
    I want to see all my offers together
    So that I can view offers and make decisions

  Scenario: View offer letter list
    Given I logged in as an employee
    When I navigate to Offer Letters page
    Then I see the offer letter list
    But I know that Offer Letters page can be empty

  Scenario Outline: View offer letter list on the mobile
    Given I logged in as an employee
    And I have offers
    When I want to view the status of my offers
    And click 'Offer Letters'
    Then I see the offer letter list
    When I view the offer with "<status_name>" status
    Then I see "<result>" fields

    Examples:
      | status_name | result |
      | Outstanding | position, client, offer date, start date, pay rate |
      | Accepted | position, client, offer date, start date, pay rate |
      | Declined | position, client, offer date, start date, ray rate, reason |
      | Rescinded | position, client, offer date, start date, pay rate, reason |
      | Expired | position, client, offer date, start date, expiration date, pay rate |

  Scenario: My offer letter table column headers
    Given I logged in as an employee
    And I have offers
    When I want to view all my offers
    And click 'Offer Letters'
    Then I see the offer letter list
    And I see the table columns: position, status, client, offer date, start date, work location, pay rate, offer letter, reasons

  Scenario: Check statuses
    Given I logged in as an employee
    And I have offers
    When I want to view the status of my offers
    And click 'Offer Letters'
    Then I see the offer letter list
    And I can see what offers are outstanding, declined, accepted, expired, rescinded
