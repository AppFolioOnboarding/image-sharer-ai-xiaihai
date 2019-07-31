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

  def test_create_valid_link
    assert_difference 'Image.count', 1 do
      post images_path, params: { image: {link: 'http://valid.com'} }
    end
  end

  def test_create_invalid_link
    assert_no_difference 'Image.count' do
      post images_path, params: { image: {link: 'invalid-com'} }
    end
  end
end
