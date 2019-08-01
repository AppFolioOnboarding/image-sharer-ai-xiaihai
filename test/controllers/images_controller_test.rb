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

  def test_show
    image = Image.create!(link: 'http://valid.com')
    get image_path(image.id)
    assert_response :ok
    assert_select 'img' do
      assert_select '[src=?]', 'http://valid.com'
    end
  end

  def test_create_valid_link
    assert_difference 'Image.count', 1 do
      post images_path, params: { image: { link: 'http://valid.com' } }
    end
  end

  def test_create_invalid_link
    assert_no_difference 'Image.count' do
      post images_path, params: { image: { link: 'invalid-com' } }
    end
  end

  def test_index
    Image.create!(link: 'http://valid1.com')
    Image.create!(link: 'http://valid2.com')
    get images_path
    assert_response :ok

    assert_select 'img' do |elements|
      elements.each_with_index do |element, index|
        assert_equal element[:src], "http://valid#{2 - index}.com"
      end
    end
  end
end
