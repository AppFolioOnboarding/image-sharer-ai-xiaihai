require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  def test_home
    get root_path
    assert_response :ok
  end

  def test_home_view_body
    get root_path
    assert_select 'h1', 'home'
    assert_select 'p', 'Put in anything!'
  end
end
