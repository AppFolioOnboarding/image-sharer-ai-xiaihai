require 'test_helper'

class ImageControllerTest < ActionDispatch::IntegrationTest # rubocop:disable Metrics/ClassLength
  def test_new
    get new_image_path
    assert_response :ok
  end

  def test_new_view_body
    get new_image_path
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

    assert_select 'a', 'delete this image' do |elements|
      assert_equal elements.size, 1
      assert_equal elements[0][:href], image_path(image)
    end

    assert_select 'a', 'create an image' do |element|
      assert_equal element.size, 1
      assert_equal element[0][:href], new_image_path
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
    Image.create!(link: 'http://valid1.com', tag_list: '2, 3', visible: 1)
    Image.create!(link: 'http://valid0.com', tag_list: '0, 1', visible: 1)
    Image.create!(link: 'http://deleted.com', tag_list: '0, 3', visible: 0)
    get images_path
    assert_response :ok

    assert_select 'a', 'create an image' do |element|
      assert_equal element.size, 1
      assert_equal element[0][:href], new_image_path
    end

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

    assert_select 'a', 'delete this image' do |elements|
      elements.each_with_index do |element, index|
        assert_equal element[:href], image_path(2 - index)
      end
    end
  end

  def test_index_filter_single_tag
    Image.create!(link: 'http://valid1.com', tag_list: 'a, b', visible: 1)
    Image.create!(link: 'http://valid.com', tag_list: 'b', visible: 1)
    Image.create!(link: 'http://valid0.com', tag_list: 'a, c, d', visible: 1)
    Image.create!(link: 'http://deleted.com', tag_list: 'a, d', visible: 0)

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

  def test_destroy
    image1 = Image.create!(link: 'http://valid1.com', visible: 1)
    image2 = Image.create!(link: 'http://valid2.com', visible: 1)

    delete image_path(image1)
    image1.reload
    image2.reload
    refute_predicate image1, :visible?
    assert_predicate image2, :visible?

    follow_redirect!
    assert_select 'p' do |elements|
      assert_includes elements[0].to_s, 'See all the images'
    end
  end
end
