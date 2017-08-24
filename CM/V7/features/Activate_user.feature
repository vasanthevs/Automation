Feature: To activate a user
  As a Full manager
  I want to activate a user in this project


  @Activateuser @smoke @p2 @Ssmoke @Tsmoke @p5

  Scenario: Activate User

    When I click on User status and click on inactive users
    And I select the user name "sulla"
    And I select "Activate" option from "Actions" menu
    Then I should see the "sulla" in the grid
