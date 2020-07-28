@P2 @PLAT-945
Feature: User roles enhancements


  Scenario Outline: Check User roles/permissions
    Given a login page is opened
    When user is logged in as "<user_role>"
    Then user can "<permissions>"

    Examples:
      | user_role | permissions |
      | Employee | Edit T&E |
      | Program Manager  | View Offers, Create Offers |
      | Worksite Manager | Approve/Reject T&E, View Offers, Create Offers |
      | Client Approver | Approve/Reject T&E, View Offers, Create Offers |
      | Onboarding Coordinator | View Offers, Create Offers |
      | Account Manager (director) | View Offers, Create Offers, Modify Client Settings, Create New Clients |
      | Payroll processor | View Offers, Modify Client Settings, Create New Clients, Payroll Processing, Set User Permissions, Group timesheet entry, Work Location Position addition |
      | Super Admin | Edit T&E, Approve/Reject T&E, View Offers, Create Offers, Modify Client Settings, Create New Clients, Payroll Processing, Set User Permissions, Group timesheet entry, Work Location Position addition, Work Location Position deletion |
