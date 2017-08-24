Feature: To Move a doc
  As a Full manager
  I want to move a document in the samefileroom

  @Movetosameroom @Ssmoke @Tsmoke @smoke @p2

  Scenario: Move to same fileroom

    When I select the "Zebronics" document
    And I select "Move To" option from "Actions" menu
    And I click on move to wizard
    And i click on folder
    And click on save button
    And select the secuity level
    And Click on publish option
    When I select the "Folder1" folder
    Then I should see the moved doc "Zebronics" in the grid