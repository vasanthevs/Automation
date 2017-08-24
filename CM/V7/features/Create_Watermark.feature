Feature: To create a watermark template
  As a Full manager
  I want to create a watermark template



 @watermarktemplate @Ssmoke @Tsmoke @smoke  @p3
  Scenario: Create Watemark
    When i click on New menu
    Then i click on Watermark
    And i click on Template Title and enter "WM_1"
    And click on save button
    And click on save button
    Then I should see the created "WM_1" in the grid

