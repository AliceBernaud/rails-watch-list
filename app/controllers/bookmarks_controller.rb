class BookmarksController < ApplicationController
  before_action :set_movie, only: %i[new create]

  def new
    @bookmark = Bookmark.new

  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save!
    redirect_to list_path(@list)
  end


  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

    def bookmark_params
      params.require(:bookmark).permit(:comment, :movie_id)
    end

    def set_movie
      @list = List.find(params[:list_id])
    end


end
