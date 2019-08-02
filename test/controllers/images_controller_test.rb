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
    image = Image.create!(link: 'http://valid.com', tag_list: 'tag1, tag2')
    get image_path(image.id)
    assert_response :ok
    assert_select 'img' do
      assert_select '[src=?]', 'http://valid.com'
    end
    assert_select 'div.tag', 'tag1'
    assert_select 'div.tag', 'tag2'
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

  def test_create_tags
    assert_difference 'Image.count', 1 do
      post images_path, params: { image: { link: 'http://valid.com', tag_list: 'tag1, tag2' } }
    end
    assert_equal %w[tag1 tag2], Image.last.tag_list
  end

  def test_index
    Image.create!(link: 'http://valid1.com', tag_list: '1a, 1b')
    Image.create!(link: 'http://valid2.com', tag_list: '2a, 2b')
    get images_path
    assert_response :ok

    assert_select 'img' do |images|
      images.each_with_index do |image, index|
        assert_equal image[:src], "http://valid#{2 - index}.com"
      end
    end

    assert_select 'div.tags' do |tags|
      tags.each_with_index do |tag, index|
        assert_includes tag.to_s, "#{2 - index}a, #{2 - index}b"
      end
    end
  end
end
