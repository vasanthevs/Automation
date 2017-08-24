Feature: Documents - Upload New menu
  As a Full manager
  I want to upload documents to the fileroom
  So that I can make use of the uploaded files later

  @uploaddocsnew @Ssmoke @Tsmoke @smoke @p1 @test
  Scenario: Upload documents to the fileroom
    When I double click and get into the "UploadDocViaNew" fileroom
    And I select "Upload Document" option from "New" menu
    And I browser and select the files to be uploaded
    Then I should see the created "Zebronics" in the grid
    Then I should come out of the fileroom





