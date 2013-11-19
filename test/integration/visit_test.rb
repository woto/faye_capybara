# encoding: utf-8
#
require 'test_helper'

class VisitTest < ActionDispatch::IntegrationTest
  test 'Visiting root page with Capybara shoud not raise error' do
    visit '/'
  end
end
