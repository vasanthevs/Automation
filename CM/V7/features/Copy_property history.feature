Feature: To copy a doc to same fileroom and verify audit
  As a Full manager
  I want to copy a document in the samefileroom and verify history is captured


  @Copypropertyhistory @smoke @p3 @Ssmoke @Tsmoke

  Scenario: copy to same fileroom property history

    When I select the "Zebronics" document
    And I select "Copy To" option from "Actions" menu
    And I click on Copy to wizard
    And i click on folder
    And click on save button
    And select the secuity level
    And Click on publish option
    When I select the "Folder1" folder
    When I select the "Zebronics" document
    And I select "Change History" option from "History" menu
    Then I should see copy in the Change type column




