@P3
Feature: Create new account/register
    As an employee
    I want to be able to register for new employee account
    So that I can continue with tasks

  Scenario: Open the create account screen
    Given I am an employee
    And I received an offer
    When I click the link to create account
    Then Create account screen is opened
    And I can create account

  Scenario: Email, first and last name should be pre-populated with the information from the offer, if available
    Given I am an employee
    And I received an offer
    And email, first and last name were filled by the manager during offer creation
    When I click the link to create account
    Then I see that email, first and last name is pre-populated
    And I don't have to populate it

  Scenario: Password requirements
    Given I am an employee
    When I create a password
    And typing 8 characters, upper case, number, and special character
    Then I see that created password matches with the requirements
    When I confirm a password
    Then I can continue the registration process

  Scenario: Register as an employee
    Given I am an employee
    And Create account screen is opened
    When I fill in the first name, last name, username fields
    And generate a valid password
    And confirm password
    And agree to the terms and conditions
    Then I'm ready to register
    When I click 'Register'
    Then I see a message: A confirmation email has been sent. Please check your email to complete the registration process

  Scenario: Confirm registration
    Given I am an employee
    And confirmation email is sent to me
    When I check my email
    And click 'Confirm Email'
    Then login page is opened
    And I can log in

  Scenario: Password mismatch
    Given I am an employee
    When I create a password
    And typing 8 characters, upper case, number, and special character
    Then I see that created password matches with the requirements
    When I make a mistake in the confirm password filed
    Then I see a message: Password and password confirmation should be equal
