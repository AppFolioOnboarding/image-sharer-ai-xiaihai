require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_empty_link
    image_empty_link = Image.new
    refute_predicate image_empty_link, :valid?
  end

  def test_invalid_link
    image_invalid_link = Image.new(link: '1:giberish')
    refute_predicate image_invalid_link, :valid?
  end

  def test_valid_link
    image_valid_link = Image.new(link: 'https://www.google.com/')
    assert_predicate image_valid_link, :valid?
  end
end
