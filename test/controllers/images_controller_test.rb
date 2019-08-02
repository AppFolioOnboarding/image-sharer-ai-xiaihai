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
    image = Image.create!(link: 'http://valid.com', tag_list: 'tag0, tag1')
    get image_path(image.id)
    assert_response :ok
    assert_select 'img' do
      assert_select '[src=?]', 'http://valid.com'
    end

    assert_select 'div.tag > a' do |tags|
      tags.each_with_index do |t, index|
        assert_includes t.to_s, "tag#{index}"
        assert_equal t[:href], images_path(tag: "tag#{index}")
      end
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

  def test_create_tags
    assert_difference 'Image.count', 1 do
      post images_path, params: { image: { link: 'http://valid.com', tag_list: 'tag1, tag2' } }
    end
    assert_equal %w[tag1 tag2], Image.last.tag_list
  end

  def test_index_get_all
    Image.create!(link: 'http://valid1.com', tag_list: '2, 3')
    Image.create!(link: 'http://valid0.com', tag_list: '0, 1')
    get images_path
    assert_response :ok

    assert_select 'img' do |images|
      images.each_with_index do |image, index|
        assert_equal image[:src], "http://valid#{index}.com"
      end
    end

    assert_select 'div.tag > a' do |tags|
      tags.each_with_index do |tag, index|
        assert_includes tag.to_s, index.to_s
        assert_equal tag[:href], images_path(tag: index.to_s)
      end
    end
  end

  def test_index_filter_single_tag
    Image.create!(link: 'http://valid1.com', tag_list: 'a, b')
    Image.create!(link: 'http://valid.com', tag_list: 'b')
    Image.create!(link: 'http://valid0.com', tag_list: 'a, c, d')

    get images_path(tag: 'a')
    assert_response :ok
    assert_select 'img' do |images|
      images.each_with_index do |image, index|
        assert_equal image[:src], "http://valid#{index}.com"
      end
    end

    get images_path(tag: 'c')
    assert_response :ok
    assert_select 'img' do |images|
      assert_equal images.length, 1
      assert_equal images[0][:src], 'http://valid0.com'
    end
  end
end
