require 'test_helper'

class ImageControllerTest < ActionDispatch::IntegrationTest
  def test_new
    get root_path
    assert_response :ok
  end

  def test_new_view_body
    get root_path
    assert_select 'p', 'New Image Submission Page'
  end
end
