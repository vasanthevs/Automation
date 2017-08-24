Feature: To copy a doc to different fileroom and verify audit
  As a Full manager
  I want to copy a document in the differentfileroom and verify the audit


  @Copytodifferentpropertyhistory @smoke @p3 @Ssmoke @Tsmoke

  Scenario: Copy to different Fileroom property history

    When I select the "Zebronics" document
    And I select "Copy To" option from "Actions" menu
    And I select on Copy to wizard
    And click on save button
    And select the secuity level
    And Click on publish option
    And I should come out of the fileroom
    And I double click and get into the "C_doc1" fileroom
    When I select the "Zebronics" document
    And I select "Change History" option from "History" menu
    Then I should  see copy in the Change type column