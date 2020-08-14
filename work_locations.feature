@P2 @PLAT-960
Feature: Work Locations
    As a manager I want to be able to create multiple clients work locations

  Scenario: Create new work location
    Given client settings opened
    When user clicks 'Work Location'
    And click 'Add Work Location'
    Then 'Create New Work Location' form is opened
    When user fills required fields
    And clicks 'Create Work Location'
    Then new work location is added to the list of work locations

  Scenario: Edit work location
    Given client settings opened
    When user clicks a pencil icon
    Then 'Edit New Work Location' form is opened
    When user makes changes
    And clicks 'Save'
    Then work location is updated
    And data is updated in Prism

  Scenario: Cancel editing
    Given user logged in as an admin
    And Work Location section is opened
    When user clicks "Add Work Location"
    Then "Create New Work Location" form is opened
    When user clicks "Cancel" button
    Then form is closed

  Scenario: View work location page
    Headers: ID, WORK LOCATION, STATE, ZIPCODE
    Given user logged in as an admin
    And client settings opened
    When user clicks 'Work Location' section
    Then added work locations are displayed in the table
    But table can be empty
    And user can add location by clicking 'Add Work Location' button

  Scenario: Work location must be created/updated in Prism
    Check Ovveride Work Geocode and Address
    Given user logged in as an admin
    And Work location section is opened
    When user edits override work geocode
    And save changes
    Then new changes are applied
    When user opens work location details in Prism
    Then user sees updated override work geocode

  Scenario: Delete work location
    Given user logged in as an admin
    And Work location section is opened
    And there is added work locations
    When user clicks a trash icon
    Then work location is removed
