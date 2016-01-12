class TagsController < ApplicationController
  def create
    @tag = Tag.create(params.require(:name))
    redirect_to tags_url
  end
end
