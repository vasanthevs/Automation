Feature: To copy a doc
  As a Full manager
  I want to copy a document in the differentfileroom


  @Copytodifferentroom @smoke @p2 @Ssmoke @Tsmoke

  Scenario: Copy to different Fileroom

    When I select the "Zebronics" document
    And I select "Copy To" option from "Actions" menu
    And I select on Copy to wizard
    And click on save button
    And select the secuity level
    And Click on publish option
    And I should come out of the fileroom
    And I double click and get into the "C_doc1" fileroom
    Then I should see the copied doc "Zebronics" in the grid
