Feature: To copy a watermark template

  As a Full manager i want to copy
  a watermark template

  @Copywatermark  @p3 @Ssmoke @Tsmoke @smoke

    Scenario: Copy watermark
    Then i click on "Watermark"
    And I select "Copy" option from "Actions" menu
    And i click Template Title and enter "WM_Copy"
    And click on save button
    Then I should see the created "WM_Copy" in the grid

