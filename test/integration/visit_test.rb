# encoding: utf-8
#
require 'test_helper'

class VisitTest < ActionDispatch::IntegrationTest

  test 'Visiting root page with Capybara shoud not raise error' do

    Capybara.session_name = :first
    visit '/'
    sleep 0.1

    page.execute_script <<-"EOL"

    window.Application || (window.Application = {});

    Application.client.subscribe('/messages', function(message) {
      $('body').html('Got a message: ' + message.text)
    });

    EOL

    Capybara.session_name = :second
    visit '/'
    sleep 0.1

    page.execute_script <<-"EOL"

    window.Application || (window.Application = {});

    Application.client.publish('/messages', {
      text: 'Hello world'
    });

    EOL

    Capybara.session_name = :first
    sleep 0.1

    save_screenshot 'image.png'

  end
end
