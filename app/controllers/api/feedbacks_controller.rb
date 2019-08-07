module Api
  class FeedbacksController < ApplicationController
    def create
      feedback_new = Feedback.new(name: params[:feedback][:name], comment: params[:feedback][:comment])
      if feedback_new.valid? && feedback_new.save
        render json: {}, status: 200
      else
        render json: {}, status: 422
      end
    end
  end
end
