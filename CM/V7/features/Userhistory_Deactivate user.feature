Feature: To deactivate a user and verify the audit
  As a Full manager
  I want to deactivate a user from this project and verify the audit


  @Deactivateuserhistory @Ssmoke @Tsmoke @smoke @p3

  Scenario: User history Deactive users

    When I select the user name "sulla"
    And I select "Deactivate" option from "Actions" menu
    When I click on User status and click on inactive users
    And I select the user name "sulla"
    And I click on Sulla user change "History"
    Then I should see  the status in New value Column