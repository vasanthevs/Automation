Feature: To Create a Date UDF field and associate to  from New menu
  As a Full manager
  I want to create Date UDF to the fileroom
  So that I can make use of them later

  @create_Date_udf @Ssmoke @Tsmoke @smoke @p1
  Scenario: Create Date UDF
    When I double click and get into the "create_DateUDF_FR1" fileroom
    And I select "Manage User Defined Fields" option from "Actions" menu
    And I select "Date" option from "Add Field" menu
    And I enter Date UDF name "Date_udf" in the text box
    Then I should see the created "Date_udf" in the grid
    Then I should come out of the fileroom
    And I double click and get into the "create_DateUDF_FR2" fileroom
    Then I should see the created "Date_udf" in the grid
    Then I should come out of the fileroom









