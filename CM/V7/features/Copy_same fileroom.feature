Feature: To copy a doc
  As a Full manager
  I want to copy a document in the samefileroom


  @Copytosameroom @smoke @p2 @Ssmoke @Tsmoke

  Scenario: copy to same fileroom

    When I select the "Zebronics" document
    And I select "Copy To" option from "Actions" menu
    And I click on Copy to wizard
    And i click on folder
    And click on save button
    And select the secuity level
    And Click on publish option
    When I select the "Folder1" folder
    Then I should see the copied doc "Zebronics" in the grid

