# frozen_string_literal: true

require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test 'should get items' do
    get root_path
    assert_response :success
    assert_select 'title', 'items | Rwanda Shopping'
  end
end
