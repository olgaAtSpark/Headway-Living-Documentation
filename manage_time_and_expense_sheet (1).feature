@PLAT-1082
Feature: Manage Time and Expense sheet
    As a payroll coordinator
    I want to be able to manage and submit appropriate T&Es for payroll processing
    So that people can get paid

  Scenario: Components: Tabs
    Description:
    "**Approved:** all approved and not processed sheets for previous time periods"
    "**Missing:** sheets for active employees that were not started in the previous pay period"
    "**Overdue:** sheets that were not submitted and now past due date of the previous pay period"
    "**Closed:** sheets that were processed and closed"
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

  Scenario: Time and Expense page in Payroll section
    Given I logged in as a payroll processor
    When I click on Time and Expense sheets under payroll in the menu
    Then it displays the approved status tab

  Scenario: Total summary must be calculated based on filters and selection
    Given I logged in as a payroll processor
    When I filter timesheet by an employee
    And client
    And pay period
    Then total summary is calculated according to selected filters

  Scenario: Filters must be persisted between tabs
    Given I logged in as a payroll processor
    When I select filters
    And switching between tabs
    Then selected filters are persisted

  Scenario: Search by Employee
    As a payroll processor, I can search for an employee so I can find just that person’s T&E sheet.
    Given I logged in as a payroll processor
    When I find an employee using the filter by employee
    And I enter name or surname
    Then results display in the table under filters
    But table should be empty if employee not found
    And payroll processer sees a message: Employee not found

  Scenario: Filter by client
    As a payroll processor, I can filter by client in a drop down so I can see just those results.
    Given I logged in as a payroll processor
    When I filter timesheets by client
    And I select a client in a drop-down
    Then I see just those result that related to selected client

  Scenario: Filter by pay period
    As a payroll processor, I can filter by pay period in a drop down so I can see just those results.
    Given I logged in as a payroll processor
    When I filter timesheets by pay period
    And I select pay period in a drop-down
    Then I see just those result that related to selected pay period

  Scenario: Initialize payroll for one client
    As a payroll processor, I can select all approved timesheets and create a payroll batch.
    Given I logged in as a payroll processor
    And there are approved timesheets under one client
    When I click the checkboxes for all approved timesheet to create a payroll batch
    Then Initialize payroll button appears
    When I click button
    Then create payroll batch pop up is opened
    When I set pay date for payroll batch
    And click Initialize payroll
    Then payroll batch is created
    And timesheet goes under the 'Closed' tab

  Scenario: Initialize payroll for several clients
    Given I logged in as a payroll processor
    And there are approved timesheets under multiple clients
    When I click the checkboxes for all approved timesheet to create a payroll batch
    Then Initialize payroll button appears
    When I click button
    Then create payroll batch pop up is opened
    And timesheets are grouped by client
    And I can set a pay date for each client
    When I set pay date for payroll batch
    And click Initialize payroll
    Then payroll batch is created
    And timesheets go under the 'Closed' tab

  Scenario: Displays Prism Batch ID for T&E with closed status
    Once the T&E is under the closed status, a “Prism Batch ID” is created and displays in the details.
    Given I logged in as a payroll processor
    And there is time or expense sheets in 'closed' status
    And 'closed' tab is opened
    When I click the arrow
    Then timesheet details opened
    And Prism Batch ID displays in the details

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
