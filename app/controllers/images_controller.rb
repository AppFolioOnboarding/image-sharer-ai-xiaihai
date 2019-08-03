class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def show
    image = Image.find(params[:id])
    @link = image.link
    @tag_list = image.tag_list
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
                    Image.order('id DESC')
                  else
                    Image.tagged_with(params[:tag]).order('id DESC')
                  end
  end
end
