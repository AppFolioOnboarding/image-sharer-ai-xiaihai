require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  def test_feedback__valid
    feedback_valid = Feedback.new(name: 'Frank', comment: 'DMV is slow')
    assert_predicate feedback_valid, :valid?
  end

  def test_feedback__invalid_name
    feedback_invalid_name = Feedback.new(comment: 'DMV is slow')
    refute_predicate feedback_invalid_name, :valid?
  end

  def test_feedback__invalid_comment
    feedback_invalid_comment = Feedback.new(name: 'Frank')
    refute_predicate feedback_invalid_comment, :valid?
  end
end
