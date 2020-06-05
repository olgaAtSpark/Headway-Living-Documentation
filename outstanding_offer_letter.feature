@P3
Feature: Outstanding offer letter
    As an employee
    I want to be able to restart progress on the outstanding offer letter
    So that I can complete it

  Scenario Outline: Navigate to offer letter
    Given I logged in as an employee
    And I have the offer letters
    And I finished onboarding on the "<current_step>" step
    When I click on the Outstanding offer letter row
    Then the system navigates to the "<current_step>" step
    And the offer is outstanding until the full onboarding process is complete

    Examples:
      | current_step |
      | Offer Letter |
      | Profile |
      | Onboarding |
