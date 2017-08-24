Feature: To Delete a watermark template
  As a Full manager
  I want to Delete a watermark template


 @Deletewatermarktemplate @Ssmoke @Tsmoke @smoke  @p3

  Scenario: Delete watermark
    When i click on "WM_1"
    And I select "Delete" option from "Actions" menu
    Then I should not see the "WM_1" in the grid
