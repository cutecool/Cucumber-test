require 'watir-webdriver'
require 'colorize'

browser = nil


假如(/^我已經在 ezScrum 的登入頁面$/) do
  browser = Watir::Browser.new
  browser.goto "http://140.124.181.115:8080/ezScrum"
  sleep(1)
end

當(/^輸入帳號密碼並登入$/) do
  browser.text_field(:name, "userId").set("admin")
  browser.text_field(:name, "password").set("admin")
  sleep(1)
  browser.button(:name, "Next").click
end

那麼(/^我可以在畫面的右上角看到我的帳號和名稱"(.*?)"$/) do |arg1|
  sleep(1)
  d = browser.div :id => "UserNameInfo_Project"
  expect(d.text).to eq arg1
  sleep(1)
  browser.close
end

當(/^輸入"(.*?)"和"(.*?)"並登入$/) do |arg1, arg2|
  browser.text_field(:name, "userId").set(arg1)
  browser.text_field(:name, "password").set(arg2)
  sleep(1)
  browser.button(:name, "Next").click
end

那麼(/^我可以在畫面的右上角看到"(.*?)"$/) do |arg1|
  sleep(1)
  
  if browser.div(:id, "UserNameInfo_Project").exist?
    d = browser.div :id => "UserNameInfo_Project"
    expect(d.text).to eq arg1
  else
    expect(browser.div(:id, "UserNameInfo_Project").exist?).to be false
  end

  sleep(1)
  browser.close
end