Feature: To activate a user and verify audit
  As a Full manager
  I want to activate a user in this project and verify his audit


  @Activateuserhistory @Ssmoke @Tsmoke @smoke @p3

  Scenario: User history Active users

    When I click on User status and click on inactive users
    And I select the user name "sulla"
    And I select "Activate" option from "Actions" menu
    And I click Active link
    And I select the user name "sulla"
    And I click on Sulla user change "History"
    Then I should see the status in New value Column
