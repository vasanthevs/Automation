## This file will have the common steps ##
require 'yaml'
config = YAML.load_file("#{$filePath}object-repository.yaml")
$cfg = config

$tempPath = 'C:\\Users\\Administrator\\Downloads\\'

############################################################################

#==============step_definations for login ===================================#

# When(/^I enter username and password$/) do
#   sleep(2)
#   if ENV['env'] == 'Test'
#     step "I enter username 108643@merrillcorp.com and password Fullman@1619"
#   elsif ENV['env'] == 'Stage'
#     step "I enter username 108643@merrillcorp.com and password Fullman@1619"
#   end
# end

When(/^I enter username and password$/) do
  sleep(5)
  if ENV['env'] == 'prod'
    # index = rand(1..10)
    # step "I enter username kittusdad+#{index}@gmail.com and password Prodfull001111"
    step "I enter username kittusdad+65233@gmail.com and password Prodfull0011111"
  elsif ENV['env'] == 'test'
    step "I enter username kittusdad+65233@gmail.com and password Prodfull001111"
  elsif ENV['env'] == 'stage'
    step "I enter username kittusdad+65233@gmail.com and password Prodfull001111"
  end
end


When(/^I navigate to the project$/) do
  if ENV['env']== 'test'
    find(:xpath,config['ENV']['testENV']).click
    step "I need to wait progress div"
  elsif ENV['env']== 'prod'
    # visit "https://datasite-prod.merrillcorp.com/ds/r/ds/project/69c6f7ac-9036-4ff4-a76c-3cc48429fde2"
    find(:xpath,config['ENV']['prodENV']).click
    step "I need to wait progress div"
  elsif ENV['env']== 'stage'
    find(:xpath,config['ENV']['stageENV']).click
    step "I need to wait progress div"
  end
end

############################################## Add_FR###################################


And(/^I enter "([^"]*)" fileroom name in the text box$/) do |frtext|
  fill_in('fileroomTitle',:with=>frtext)
  find(:id,"fileRoomSaveButton").click
  sleep 7
end

Then(/^I should see the created "([^"]*)" in the grid$/) do |frname|
  expect(page).to have_content frname
  sleep 10
end


##############################################Delete_FR_#################################


When(/^I select the fileroom name "([^"]*)"$/) do |frname|
  find(:xpath,config['commonSpan']['selFr'].sub("TEXT",frname)).click
  sleep 2
end


And(/^I select "([^"]*)" option from "([^"]*)" menu$/) do |opt,action|
  click_on action
  click_on opt
  sleep 5
end

Then(/^I click on "([^"]*)" button$/) do |button|
  click_on button
  sleep 10
end

Then(/^I should not see the "([^"]*)" in the grid$/) do |fr|
  sleep 15
  expect(page).not_to have_content fr
end


##############################################Upload_docs_#################################

When(/^I double click and get into the "([^"]*)" fileroom$/) do |ducli|
  sleep 10
  find(:xpath, config['commonSpan']['selFr'].sub("TEXT", ducli)).double_click
  sleep 10
end


And(/^I browser and select the files to be uploaded$/) do

  within(:xpath,"//div[@id='uploadFileWindow']") do
    Capybara.ignore_hidden_elements = false
    z = page.find(:xpath,"//*[@type='file']", :visible =>false)['name']
    attach_file(z, File.absolute_path('C:\Ruby_Devkit_Softwares\Zebronics.docx'))
    sleep 10
    page.first(:xpath,"//button[text()='Publish']", :visible => true).click
  end
  Capybara.ignore_hidden_elements=true
  page.click_on("ext-gen375")
  sleep(10)
end

Then(/^I should come out of the fileroom$/) do
  sleep 10
  # find(:xpath,"//div[contains(text(),'Double click row to go back']").double_click
  find(:xpath,"//div[contains (text(),'To Parent')]").double_click
  sleep 5
end

########################Create_folder.rb######################################

And(/^I enter folder name "([^"]*)" in the text box$/) do |fname|
  fill_in('placeholderItemsTitle',:with=>fname)
  click_button 'Publish'
  sleep 10
end

########################Date_udf.rb######################################

And(/^I enter Date UDF name "([^"]*)" in the text box$/) do |dudfname|
  # find(:xpath, config['commonSpan']['dateudf']).set("#{dudfname}")
  fill_in('label',:with=>dudfname)

  check("allAssociated")
  sleep(5)
  page.click_on("Save")

  sleep 15
  page.click_on("Done")
  sleep 7

  #fill_in(find(:css,['name=label']['type=text']),:with=>dudfname)

  #find(:xpath, config['documents_obj']['searchBox']).set("")
end

########################Editrow.rb######################################
When(/^I select the Placeholder file$/) do
  find(:xpath,config['commonSpan']['chkall']).click
end


And(/^I enter "([^"]*)" in the Description field$/) do |desc|
  find(:xpath,config['commonSpan']['desc']).set(desc)
end

########################Basic search.rb######################################
When(/^I enter "([^"]*)" in the search field$/) do |src|
  # visit 'https://datasite-prod.merrillcorp.com/ds/r/ds/project/69c6f7ac-9036-4ff4-a76c-3cc48429fde2'
  sleep 20
  # fill_in('x-form-text x-form-field x-form-empty-field',:with=>src)
  # fill_in(find(:xpath,"//div[@class='x-box-inner search-trigger-main']//input"),:with=>src)
  # fill_in 'ext-comp-1296',:with=>src
  find(:xpath,"(//input[@type='text'])[2]").set(src)
  # fill_in 'ext-comp-1319',:with=>src
end

Then(/^I should see the  "([^"]*)" in the viewer$/) do |zeb|
  expect(page).to have_content zeb
end

And(/^I click on Global search Button$/) do
  find(:xpath,config['commonSpan']['searchbox']).click
  sleep 3
end


Then(/^I click on "([^"]*)" search document$/) do |szeb|
  sleep 15
  page.find(:xpath,config['commonSpan']['selFr'].sub("TEXT",szeb)).double_click

  sleep  10
end

Then(/^I click on "([^"]*)" document$/) do |szeb|
  sleep 15
  page.find(:xpath,config['commonSpan']['selFr'].sub("TEXT",szeb)).double_click

  sleep  10
end

Then(/^i close the viewer$/) do
  within_window windows.last do
    current_window.close
  end
  # browser.window(:title => /Datasite: 1 - Zebronics -Google Chrome/).use do
  #   #Whatever you want to do with the popup

  sleep 20

end

Then(/^i close the Search results$/) do
  page.find(:xpath,config['commonSpan']['SeaRes']).click
end

###############################Delete_Doc.rb##################################

When(/^I select the Document file$/) do
  find(:xpath,config['commonSpan']['chkall']).click
end

###############################Copy_samefileroom.rb##################################

When(/^I select the "([^"]*)" document$/) do |szeb|
  page.find(:xpath,config['commonSpan']['selFr'].sub("TEXT",szeb)).click
end

And(/^I click on Copy to wizard$/) do
  find(:xpath,config['commonSpan']['CopyEx']).click
end

And(/^I click on the "([^"]*)" folder$/) do |fol|
  #with_in(:xpath,"moveToWindow").click
  find(:xpath,config['commonSpan']['Sfolder'].sub("TEXT",fol)).click
  sleep(3)
end

And(/^click on save button$/) do
  page.click_on('Save')
  sleep 10
end

And(/^select the secuity level$/) do
  find(:xpath,config['commonSpan']['Asecurity']).click
end

And(/^Click on publish option$/) do
  page.click_on('Publish')
  sleep 10
end

And(/^i click on folder$/) do
  sleep 2
  find(:xpath,config['commonSpan']['Sfolder']).click
end

When(/^I select the "([^"]*)" folder$/) do |fol|

  page.find(:xpath,config['commonSpan']['selFr'].sub("TEXT",fol)).double_click
  sleep 20
end

Then(/^I should see the copied doc "([^"]*)" in the grid$/) do |zdoc|
  expect(page).to have_content zdoc
end

And(/^i click on tree folder$/) do
  sleep 10
  find(:xpath,config['commonSpan']['Tfolder']).double_click
end

###############################Move_samefileroom.rb##################################

And(/^I click on move to wizard$/) do
  find(:xpath,config['commonSpan']['CopyEx']).click
  sleep 3
end

Then(/^I should see the moved doc "([^"]*)" in the grid$/) do |mdoc|
  sleep 15
  expect(page).to have_content mdoc
end

###############################Copy_differentfileroom.rb##################################

And(/^I select on Copy to wizard$/) do
  find(:xpath,config['commonSpan']['froom']).click
end

# When(/^I select the "([^"]*)" fileroom$/) do |file|
#   page.find(:xpath,config['commonSpan']['selFr'].sub("TEXT",file)).double_click
# end

###############################Move_differentfileroom.rb##################################

And(/^I select on move to wizard$/) do
  find(:xpath,config['commonSpan']['froom1']).click
end

###############################Editsecurity_publish_hook##################################


And(/^I select "([^"]*)" option from Edit wizard and publish$/) do |opt|
  within(:xpath,"(//div[@class='ds-sub-panel-body'])[1]") do
    page.find(:xpath," (//*[@title='Apply print level security'][1]//..//..)[1]").click
    # find(:xpath,"(//div[@class='ds-sub-panel-body'])[1]//span[text()='#{opt}']").click
    sleep 10
  end
end


Then(/^verify Print is set to the document$/) do
  steps %{
  When I select the Document file
  And I select "Edit Security" option from "Actions" menu
 And I select "print" option from Edit wizard and publish
        }

  expect(page).to have_xpath("//li[@class='securityCheckBox rDatasitePrint_checkbox securityCheckBoxExistingTrue']")
end

###############################Editsecurity_assign_hook##################################

And(/^I select print option from Edit wizard and Assign$/) do
  page.find(:xpath," (//*[@title='Apply print level security'][1]//..//..)[1]").click
  page.find(:xpath,"(//button[@class=' x-btn-text' and text() ='Publish']/../../..)/td[3]").click
  page.find(:xpath,"//span[@class='x-menu-item-text' and text() = 'Assign']").click
  sleep 5
end


When(/^I select the assigned task$/) do
  find(:xpath,config['commonSpan']['chkall']).click
end



And(/^I click documents link$/) do
  find(:id,"manageDocumentsQuickView").click
  sleep 2
end

###############################Deactivateuser_hook##################################

When(/^I select the user name "([^"]*)"$/) do |eid|
  find(:xpath,config['commonSpan']['selFr'].sub("TEXT",eid)).click
end


And(/^I click on User status and click on inactive users$/) do
  within(:xpath,"(//div[@class=' x-panel x-box-item'])[2]") do
    find(:xpath,"//a[contains(text(),'Inactive')]").click
  end
end

###############################Activateuser_hook##################################

Then(/^I should see the "([^"]*)" in the grid$/) do |uname|
  find(:xpath,"//a[contains(text(),'Active')]").click
  expect(page).to have_content uname
end

###############################Create a Security role_hook##################################

And(/^I enter Security role name "([^"]*)" in the text box$/) do |stext|
  dateTime=Time.new
  $labelTemp = stext+"#{dateTime.strftime("%d-%b-%Y %H:%M")}"
  fill_in('roleCreateName',:with=>$labelTemp)
end

And(/^I enter Security role Description "([^"]*)" in the text box$/) do |dtext|
  fill_in('roleDescription',:with=>dtext)
  # click_button 'Save'
end

And(/^I select security role type$/) do
  within(:id,"addRoleForm") do
    find(:id,"roleType").click
    find(:xpath,"//div[@class='x-combo-list-item x-combo-selected']").click
    click_button 'Save'
  end
end

Then(/^I should see created role in the security roles$/) do
  sleep 5
  expect(page).to have_content"#{$labelTemp}"
end

###############################CreateWatermark_hook##################################

When(/^i click on New menu$/) do
  find(:xpath,"(//span[@class='pointer'])[1]").click
  sleep 2
end

Then(/^i click on Watermark$/) do
  find(:xpath,"(//span[@class='x-menu-item-text'])[3]").click
  sleep 1

end

And(/^i click on Template Title and enter "([^"]*)"$/) do |tem|
  fill_in'newName',:with=>tem
  sleep 2

end

###############################DeleteWatermark_hook##################################

When(/^i click on "([^"]*)"$/) do |te|
  sleep 10
  find(:xpath,config['commonSpan']['selFr'].sub('TEXT',te)).click
  sleep 5
end

###############################CopyWatermark_hook##################################

And(/^i click Template Title and enter "([^"]*)"$/) do |ct|
  fill_in'copyName',:with=>ct
end

###############################EnableWatermark_hook##################################


When(/^i click "([^"]*)"$/) do |ew|
  find(:xpath,config['commonSpan']['comSP'].sub('TEXT',ew)).click

end


And(/^i click on watermark template$/) do
  find(:xpath,"//input[@name='watermark_header_templateText']").click
end

And(/^i click on Watermark DDM$/) do
  find(:xpath,"//div[contains(text(),('Watermark'))]").click
  sleep 2
end

###############################Copy_property_history.rb##################################

Then(/^I should see copy in the Change type column$/) do
  sleep 3
  expect(page.find(:xpath,"(//div[@class = 'x-grid3-cell-inner x-grid3-col-1 x-unselectable'])[1]").text).to eq("Copy")
#  expect(page).to have_xpath("(//div[@class = 'x-grid3-cell-inner x-grid3-col-1 x-unselectable'])[1]")
end

###############################Move_property_history.rb##################################

Then(/^I should see move in the Change type column$/) do
  sleep 3
  expect(page.find(:xpath,"(//div[@class='x-grid3-cell-inner x-grid3-col-1 x-unselectable'])[2]").text).to eq("Move")
end

###############################Copy_differentproperty_history_.rb##################################


Then(/^I should  see copy in the Change type column$/) do
  sleep 3
  expect(page.find(:xpath,"(//div[@class = 'x-grid3-cell-inner x-grid3-col-1 x-unselectable'])[2]").text).to eq("Copy")
end

###############################Move_differentproperty_history_.rb##################################

Then(/^I should  see move in the Change type column$/) do
  sleep 3
  expect(page.find(:xpath,"(//div[@class='x-grid3-cell-inner x-grid3-col-1 x-unselectable'])[1]").text).to eq("Move")
end

########################Userhistory_Active user.rb####################

Then(/^I should see the status in New value Column$/) do
  sleep 5
  expect(page.find(:xpath,"(//div[@class='x-grid3-cell-inner x-grid3-col-3 x-unselectable'])[3]").text).to eq("Active")

end

And(/^I click Active link$/) do
  find(:xpath,"//a[contains(text(),'Active')]").click
end


And(/^I click on Sulla user change "([^"]*)"$/) do |uchange|
  click_on uchange
  sleep 3
end

########################Userhistory_Deactive user.rb####################

Then(/^I should see  the status in New value Column$/) do
  sleep 3
  expect(page.find(:xpath,"(//div[@class='x-grid3-cell-inner x-grid3-col-3 x-unselectable'])[1]").text).to eq("Inactive")
end

########################Z_LastScenario.rb####################
And(/^I finish the Execution$/) do
  puts 'JenkinsExit'
end
