class TagsController < ApplicationController

  def show
    @venue = Tag.find params[:id]
  end
end
