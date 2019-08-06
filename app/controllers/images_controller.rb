class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
  end

  def create
    image_new = Image.new(link: params[:image][:link], tag_list: params[:image][:tag_list])
    if image_new.valid?
      image_new.save
      redirect_to image_path(image_new.id)
    else
      @image = image_new
      render 'new'
    end
  end

  def index
    @image_list = if params[:tag].nil?
                    Image.where(visible: 1).order('id DESC')
                  else
                    Image.tagged_with(params[:tag]).where(visible: 1).order('id DESC')
                  end
  end

  def destroy
    image = Image.find(params[:id])
    image.update!(visible: 0)
    redirect_to images_path
  end
end
