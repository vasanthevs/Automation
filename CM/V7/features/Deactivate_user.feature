Feature: To deactivate a user
  As a Full manager
  I want to deactivate a user from this project


  @Deactivateuser @Ssmoke @Tsmoke @smoke @p2 @p5

  Scenario: Deactivate user

    When I select the user name "sulla"
    And I select "Deactivate" option from "Actions" menu
    Then I should not see the "sulla" in the grid



