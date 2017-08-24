## This file will have the common steps ##
require 'yaml'
require 'os'
config = YAML.load_file("#{$filePath}object-repository.yaml")

############################################################################
#   Common steps for login                                                 #
############################################################################

Given(/^I open the app$/) do
  visit '/'
  page.driver.browser.manage.window.maximize
  sleep(3)
end

# When(/^I click on project ([^"]*)$/) do |project|
#   within(:xpath, "//li[@class='carousel-container-project']/div[contains(text(),'" + project + "']") do
#     find(:xpath, "//a[contains(text(),'DOCUMENTS']").click
#   end
# end

When(/^I enter username ([^"]*) and password ([^"]*)$/) do |username, password|
  fill_in 'loginUsername', :with => username
  fill_in 'loginPassword', :with => password
  click_button 'Login'

  step "I need to wait progress div"
end

Then(/^I need to wait progress div$/) do
  res = true
  for i in 0..16
    sleep(1)
    elClass = page.find(:xpath, config['progressIcon']['loadingIcon'],:visible=> false)[:class]
    # puts elClass
    if elClass.eql? "ext-webkit ext-chrome x-border-layout-ct"
      res = true
      break
    end
  end
  expect(res).to be_truthy
end


# Then(/^the project navigation bar should be present$/) do
#   sleep(4)
#   expect(page).to have_xpath("//span[contains(text(), 'DOCUMENTS')]", wait:40)
#   step "User clicks on Documents tab"
#
# end


Then(/^I click on the project navigation ([^"]*) tab$/) do |tabName|
  page.click_on tabName

  #first(:xpath,"//span[contains(text(),#{tabName})]").click

  if (tabName == "Users")
    sleep 5
    expect(page).to have_content "All Users"

    # step "Users tab should be open"
  end
  if (tabName == "Permissions")
    # step "Permissions tab should be open"
  end
  if (tabName == "Documents")

    sleep 5
    expect(page).to have_content "Content"

    #step "I click on New Action menu and Fill in Fileroom details"
    #step "I click on New menu"
    #step "Documents tab should be open"
  end

  if (tabName == "Reports")
    step "Reports tab should be open"
  end
end

Then(/^I should be on the login page$/) do
  #reload_page()
  expect(page).to have_content('Login', wait:20)
end

Then(/^I log out$/) do
  sleep(10)
    find(:xpath, config['documents_obj']['logoutallENV'], wait:20).click
    expect(page).to have_content('Logout')
    find(:xpath, config['documents_obj']['logoutv7'], wait:20).click
  end






