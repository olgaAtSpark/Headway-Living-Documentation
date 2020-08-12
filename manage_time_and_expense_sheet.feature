@PLAT-1082
Feature: Manage Time and Expense sheet
    As a payroll coordinator
    I want to be able to manage and submit appropriate T&Es for payroll processing
    So that people can get paid

  Scenario: Components: Tabs
    Description:
    Approved: all approved and not processed sheets for previous time periods
    Missing: sheets for active employees that were not started in the previous pay period
    Overdue: sheets that were not submitted and now past due date of the previous pay period
    Closed: sheets that were processed and closed
    Given Payroll coordinator logged in
    When user clicks on “T&E sheets” under payroll in the menu
    Then Payroll Time and Expense Sheets opened
    And tabs are divided by status: approved, submitted, missing, overdue, closed and all

  Scenario: Components: Grid
    As a payroll processor, I can see an icon of the time or expense based on what is included in the sheet.
    Given Payroll coordinator logged in
    When user clicks on “T&E sheets” under payroll in the menu
    Then Payroll Time and Expense Sheets opened
    And $ and Time icon indicates the type of sheet that was submitted

  Scenario: Components: Summary
    As a payroll processor, I can see the totals for regular hours, OT hours, and pay.
    Given Payroll coordinator logged in
    When user clicks on “T&E sheets” under payroll in the menu
    Then Payroll Time and Expense Sheets opened
    And user sees the totals for regular hours, OT hours, and pay
    And totals are divided by status: total reg hrs|pay, total OT|pay, total expenses, total pay

  Scenario: Components: Filters
    Given Payroll coordinator logged in
    When user clicks on “T&E sheets” under payroll in the menu
    Then Payroll Time and Expense Sheets opened
    And user sees filters: Search by employee, Filter by client, Filter by previous pay period

  Scenario: Total summary must be calculated based on filters and selection

  Scenario: Filters must be persisted between tabs

  Scenario: Search by Employee
    As a payroll processor, I can search for an employee so I can find just that person’s T&E sheet.

  Scenario: Filter by client
    As a payroll processor, I can filter by client in a drop down so I can see just those results.

  Scenario: Filter by pay period
    As a payroll processor, I can filter by pay period in a drop down so I can see just those results.

  Scenario: Initialize payroll for one client
    As a payroll processor, I can select all approved timesheets and create a payroll batch.

  Scenario: Initialize payroll for several clients

  Scenario: Displays Prism Batch ID for T&E with closed status
    Once the T&E is under the closed status, a “Prism Batch ID” is created and displays in the details.

  Scenario: Initialize payroll for one time(expense) sheet

  Scenario: Initialize payroll for several time(expense) sheets

  Scenario: Edit Approved and Missing timesheets
    As a payroll processor, I can edit employees APPROVED and MISSING timesheets.

  Scenario: Approve/Reject timesheets
    As a payroll processor, I can approve or reject submitted timesheets.

  Scenario: Remind approvers of overdue timesheets
    As a payroll processor, I can remind approvers of overdue timesheets so that I can alert account managers to take action on those timesheets

  Scenario: Download T&E sheet
    As a payroll processor, I can download an employee’s T&E sheet.
