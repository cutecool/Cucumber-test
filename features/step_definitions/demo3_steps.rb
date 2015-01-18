require 'watir-webdriver'
require 'colorize'

browser = nil
project_name = "testProject"
display_name = "testProjectDemo"
comment = "CommentTest"
product_manager = "ABC"


假如(/^我已經登入 ezScrum 並且在專案列表頁面$/) do
  browser = Watir::Browser.new
  browser.goto "http://140.124.181.115:8080/ezScrum"
  sleep(1)
  browser.text_field(:name, "userId").set("admin")
  browser.text_field(:name, "password").set("admin")
  sleep(1)
  browser.button(:name, "Next").click
end

當(/^我新增完專案後$/) do
  # browser.table(:id => 'createProjectBtn').when_present.click
  # sleep(1)
  # browser.text_field(:xpath, "//input[@name='Name']").set(project_name)
  # browser.text_field(:xpath, "//input[@name='DisplayName']").set(display_name)
  # browser.textarea(:xpath, "//textarea[@name='Comment']").set(comment)
  # # browser.text_field(:xpath, "//textarea[@name='Comment']").set(comment)
  # browser.text_field(:xpath, "//input[@name='ProjectManager']").set(product_manager)
  # sleep(1)
  # browser.button(:text => "Submit", :class => " x-btn-text").click
  # Watir::Wait.until { browser.alert.text.include? 'Create success. Redirect to view project summary.'
  # 					  browser.alert.ok }

  d = browser.div(:text => display_name).click
end

那麼(/^我會看到專案的 Summary 頁面$/) do
  sleep(2)
  # Watir::Wait.until{browser.div(:id, "ProjectNameInfo").text 'Project :  '.concat(project_name)}
  if browser.div(:id, "ProjectNameInfo").exist?
  	d = browser.div(:id, "ProjectNameInfo")
  	expect(d.text).to eq "Project :  " + project_name
  	expect(browser.text_field(:name, "Commnet").value).to eq comment
  	expect(browser.text_field(:name, "ProjectManager").value).to eq product_manager
  else
  	puts "create project faild."
  end
  sleep(1)
  browser.close
end