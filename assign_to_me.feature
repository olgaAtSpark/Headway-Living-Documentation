@P3
Feature: Assign to me
    As a manager
    I want to be able to assign the employee to me when I'm creating the offer
    So that I can be approver of the T&E

  Scenario: Add 'Assign to' to the offer creation sidebar
    Given I am a manager
    And Create Offer tab is opened
    When I click 'Invite new employee'
    Then offer creation sidebar is opened
    And I see 'Assign to me' checkbox

  Scenario: Accepting employee is connected to the manager
    Given I am a manager
    And offer creation sidebar is opened
    When I fill all fields
    And select 'Assign to me'
    Then I am an approving manager
    When I click 'Submit Offer'
    Then offer is created

  Scenario Outline: A manager is an approver
    Given I am an approver
    And employee submitted "<entry_type>" sheet
    When I go to the "<entry_type>" Approval page
    Then I see entries that employee submitted
    And I can approve or reject them

    Examples:
      | entry_type |
      | Time |
      | Expense |
