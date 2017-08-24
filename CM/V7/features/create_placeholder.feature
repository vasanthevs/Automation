Feature: To Create a placeholder from New menu
  As a Full manager
  I want to create placeholder to the fileroom
  So that I can make use of them later

  @create_ph @Ssmoke @Tsmoke @smoke @p1 @test
  Scenario: Create Placeholder
    When I double click and get into the "create_placeholder" fileroom
    And I select "Placeholder" option from "New" menu
    And I enter folder name "placeholder" in the text box
    Then I should see the created "placeholder" in the grid
    Then I should come out of the fileroom





