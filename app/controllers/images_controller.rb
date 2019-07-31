class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    image_new = Image.new(link: params[:image][:link])
    if image_new.valid?
      image_new.save
      redirect_to image_path(image_new.id)
    else
      @image = image_new
      render 'new'
    end

  end
end
