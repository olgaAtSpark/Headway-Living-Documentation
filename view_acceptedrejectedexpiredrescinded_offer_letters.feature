@P3
Feature: View accepted/rejected/expired/rescinded offer letters
    As a user (employee or manager)
    I want to be able to view past offer letters
    So that I can verify the information is correct

  Scenario Outline: My Offers - View past offer letters
    Given I am a user
      |user_type|email|password|
      |employee|Interviewer+cmauban@headwaywfs.com|xy’d/5ugq[9KQr;w|
      |manager|Supervisor+cmauban@headwaywfs.com|8X3~chW3"RG/SLu.|
    And there are offers with "<status_type>" status
    When I view My Offers with the "<status_type>" status
    And click the link to pdf file
    Then PDF file is opened in the new tab PDF viewer

    Examples:
      | status_type |
      | accepted |
      | rejected |
      | expired |
      | rescinded |

  Scenario Outline: Client -> Offer Letter. View past offers
    Given I am a user
      |user_type|email|password|
      |employee|Interviewer+cmauban@headwaywfs.com|xy’d/5ugq[9KQr;w|
      |manager|Supervisor+cmauban@headwaywfs.com|8X3~chW3"RG/SLu.|
    And there are offers with "<status_type>" status
    And Offer Letter page is opened
    When I click "<status_type>" tab
    Then I see "<status_type>" offers
    When I click the link to pdf file
    Then PDF file is opened in the new tab PDF viewer

    Examples:
      | status_type |
      | accepted |
      | rejected |
      | expired |
      | rescinded |
