Feature: To Move a doc to same fileroom and verify audit
  As a Full manager
  I want to move a document in the samefileroom and verify the audit

  @Movepropertyhistory @Ssmoke @Tsmoke @smoke @p3

  Scenario: Move to same fileroom property history

    When I select the "Zebronics" document
    And I select "Move To" option from "Actions" menu
    And I click on move to wizard
    And i click on folder
    And click on save button
    And select the secuity level
    And Click on publish option
    When I select the "Folder1" folder
    When I select the "Zebronics" document
    And I select "Change History" option from "History" menu
    Then I should see move in the Change type column