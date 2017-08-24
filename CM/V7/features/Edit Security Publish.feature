Feature: To Publish a Doc
  As a Full manager
  I want to publish a document from the grid


  @publish @Ssmoke @Tsmoke @smoke @p2
  Scenario: Editsecurity_publish
    When I select the Document file
    And I select "Edit Security" option from "Actions" menu
    And I select "print" option from Edit wizard and publish
    And I click on "Publish" button
    Then verify Print is set to the document
    
  

