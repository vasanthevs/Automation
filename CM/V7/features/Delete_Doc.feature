Feature: To Delete a Doc
  As a Full manager
  I want to delete a document from the grid


  @DeleteDoc @Ssmoke @Tsmoke @smoke @p2
  Scenario: Delete_doc

    When I select the Document file
    And I select "Delete" option from "Actions" menu
    And I click on "Yes" button
    Then I should not see the "Zebronics" in the grid
