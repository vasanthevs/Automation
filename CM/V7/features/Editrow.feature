Feature: To Edit a Row
  As a Full manager
  I want to Edit a document through row editor
  So that I can upload files in it later

  @editrow @Ssmoke @Tsmoke @smoke @p1
  Scenario: Editrow

  When I select the Placeholder file
  And I select "Edit Row" option from "Actions" menu
  And I enter "Test" in the Description field
  And I click on "Update" button 
 Then I should see the created "Test" in the grid





