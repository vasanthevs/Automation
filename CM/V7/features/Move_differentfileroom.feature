Feature: To Move a doc
  As a Full manager
  I want to move a document in the differentfileroom


  @Movetodifferentroom @Ssmoke @Tsmoke @smoke @p2

  Scenario: Move different fileroom

    When I select the "Zebronics" document
    And I select "Move To" option from "Actions" menu
    And I select on move to wizard
    And click on save button
    And select the secuity level
    And Click on publish option
    And I should come out of the fileroom
    And I double click and get into the "M_doc1" fileroom
    Then I should see the moved doc "Zebronics" in the grid
