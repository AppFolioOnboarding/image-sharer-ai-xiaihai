require 'test_helper'

class FeedbackControllerTest < ActionDispatch::IntegrationTest
  def test_create
    assert_difference 'Feedback.count', 1 do
      post api_feedbacks_path, params: { feedback: { name: 'Frank', comment: 'DMV is slow' } }
    end
    assert_response 200
  end

  def test_create__invalid_name
    assert_no_difference 'Feedback.count' do
      post api_feedbacks_path, params: { feedback: { name: '', comment: 'DMV is slow' } }
    end
    assert_response 422
  end

  def test_create__invalid_comment
    assert_no_difference 'Feedback.count' do
      post api_feedbacks_path, params: { feedback: { name: 'Frank', comment: '' } }
    end
    assert_response 422
  end
end
