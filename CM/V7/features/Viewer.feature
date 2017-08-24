Feature: To view a document

  @Viewer @Ssmoke @Tsmoke @smoke @p1
  Scenario: Viewer_Doc
    When I double click and get into the "Doc_View" fileroom
    Then I click on "Zebronics" document
    Then I should see the  "Zebronics" in the viewer
