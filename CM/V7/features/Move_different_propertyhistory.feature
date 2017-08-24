Feature: Feature: To move a doc to different fileroom and verify audit
  As a Full manager
  I want to move a document in the differentfileroom and verify the audit


  @Movetodifferentpropertyhistory @Ssmoke @Tsmoke @smoke @p3

  Scenario: Move different fileroom property history

    When I select the "Zebronics" document
    And I select "Move To" option from "Actions" menu
    And I select on move to wizard
    And click on save button
    And select the secuity level
    And Click on publish option
    And I should come out of the fileroom
    And I double click and get into the "M_doc1" fileroom
    When I select the "Zebronics" document
    And I select "Change History" option from "History" menu
    Then I should  see move in the Change type column
