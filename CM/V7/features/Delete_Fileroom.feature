Feature: To Delete a Fileroom
  As a Full manager
  I want to delete the unwanted fileroom
  So that i can organize

  @deletefileroom @Ssmoke @Tsmoke @smoke @p1
  Scenario: Delete  fileroom
    When I select the fileroom name "RemoveFileroom"
    And I select "Deactivate Fileroom" option from "Action" menu
    And I click on "Yes" button
    When I select the fileroom name "RemoveFileroom"
    And I select "Delete Fileroom" option from "Action" menu
    And I click on "Yes" button
    Then I should not see the "RemoveFileroom" in the grid




