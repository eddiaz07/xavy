class Admin::TagsController < Admin::ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = 'El tag fue creado exitosamente'
      redirect_to admin_tags_url
    else
      flash[:warning] = @tag.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @tag.update(tag_params)
      flash[:success] = 'El tag fue actualizado exitosamente'
      redirect_to admin_tags_url
    else
      flash[:warning] = @tag.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @tag.destroy
      flash[:success] = 'El tag fue destruido exitosamente'
      redirect_to admin_tags_url
    else
      flash[:warning] = @tag.errors.full_messages.to_sentence
      render :index
    end
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:title)
  end
end
