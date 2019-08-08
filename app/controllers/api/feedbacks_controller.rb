module Api
  class FeedbacksController < ApplicationController
    def create
      feedback_new = Feedback.new(name: params[:feedback][:name], comment: params[:feedback][:comment])
      if feedback_new.valid? && feedback_new.save
        render json: { message: 'success' }, status: 200
      else
        render json: { message: 'failure' }, status: 422
      end
    end
  end
end
