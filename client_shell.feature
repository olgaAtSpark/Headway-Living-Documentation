@P2 @PLAT-959
Feature: Client Shell
    As a headway manager 
    I want to be able to create and configure a new Master client 
    So that I can continue to onboard the users

  Scenario: Settings section
    Given a login page is opened
    When user is logged in as "user_role"
      |user_role|login|password|
      |Account Manager|test-role+account_manager@headway247.com|spark|
      |Payroll Processor|test-role+payroll_processor@headway247.com|spark|
      |Super Admin|admin@headway247.com|admin|
    Then the Settings section is available at the bottom of the page

  Scenario: Create Client
    User must be able to CREATE client from Admin interface
    Given a login page is opened
    When user is logged in as "user_role"
      |user_role|login|password|
      |Account Manager|test-role+account_manager@headway247.com|spark|
      |Payroll Processor|test-role+payroll_processor@headway247.com|spark|
      |Super Admin|admin@headway247.com|admin|
    Then the Settings section is available at the bottom of the page
    When user clicks Settings
    And clicks Clients
    And clicks Add New Client
    Then Create New Client form is opened
    When user fills in the Client Details, Client Address, Client Contact
    And clicks Create Client
    Then New Client is added to the list of clients

  Scenario: View Clients dashboard
    Given a login page is opened
    When user is logged in as "user_role"
      |user_role|login|password|
      |Account Manager|test-role+account_manager@headway247.com|spark|
      |Payroll Processor|test-role+payroll_processor@headway247.com|spark|
      |Super Admin|admin@headway247.com|admin|
    Then the Settings section is available at the bottom of the page
    When user clicks Settings
    And clicks Clients
    Then user sees Add New Client button
    And headers: ID, Client, Client Manager, Create, Update, Status, State, Client Contact

  Scenario: View client details
    Given a login page is opened
    And user is logged in as "user_role"
      |user_role|login|password|
      |Account Manager|test-role+account_manager@headway247.com|spark|
      |Payroll Processor|test-role+payroll_processor@headway247.com|spark|
      |Super Admin|admin@headway247.com|admin|
    And there is an added client
    When user clicks the arrow
    Then Client Details is opened
    And user has access to: General, Work Locations, Positions, Paycodes, Timesheet Settings, Expense Settings

  Scenario: Edit Client
    User must be able to EDIT client in the admin interface
    Given user is logged in as a user which has access to settings section
    Given client settings are opened
    When I click 'General'
    Then General Account settings opened
    And I can change 'Client Details', 'Client Address', 'Client Contact'
    When I edit client
    And click 'Update'
    Then changes are saved
    And client settings page is opened

  Scenario Outline: A client must be created/updated in Prism
    Given client is "<action>"
    When user logged in as a Prism manager
    Then Prism manager sees that the client is "<action>"

    Examples:
      | action |
      | created |
      | updated |
