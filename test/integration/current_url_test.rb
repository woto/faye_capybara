# encoding: utf-8
#
require 'test_helper'

class CurrentUrlTest < ActionDispatch::IntegrationTest

  test 'Selenium test' do

    Capybara.default_driver = :selenium
    Capybara.javascript_driver = :selenium

    visit '/'
    click_link 'New Task'
    puts current_url

  end

  test 'Poltergeist test' do

    Capybara.default_driver = :poltergeist
    Capybara.javascript_driver = :poltergeist

    visit '/'
    click_link 'New Task'
    puts current_url
  end
end

