Feature: Time and Expense Entry


  Scenario: Add Time Entry
    Given user logged in as Interviewer+cmauban@headwaywfs.com
    And time & expenses page is opened
    When a user selects a work location, position, day
    And enters time
    And clicks 'Add'
    Then time entry is added to the timesheet

  Scenario: Add Expense Entry
    Given user logged in as Interviewer+cmauban@headwaywfs.com
    And time & expenses page is opened
    When a user selects a work location, position, day
    And enters time, miles, amount
    And clicks 'Add'
    Then expense entry is added to the timesheet

  Scenario: Switching between adding Time and Expense
    Given user logged in as Interviewer cmauban@headwaywfs.com
    And time & expenses page is opened
    And time selected by default
    When a user switches to adding expense
    Then miles and amount fields are added

  Scenario Outline: Check T&E dropdowns are required
    Given user logged in as Interviewer cmauban@headwaywfs.com
    And time & expenses page is opened
    When a user doesn't select "<field_name>"
    And clicks 'Add'
    Then "<field_name>" is highlighted and indicated as a required field

    Examples:
      | field_name |
      | work location |
      | position |
      | day |

  Scenario Outline: Check T&E inputs are required
    Given user logged in as Interviewer cmauban@headwaywfs.com
    And time & expenses page is opened
    When a user doesn't enter "<input_name>"
    And clicks 'Add'
    Then "<input_name>" is highlighted and indicated as a required field

    Examples:
      | input_name |
      | time |
      | miles |
      | amount |
