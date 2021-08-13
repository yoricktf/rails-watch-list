class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
      if @bookmark.save
        redirect_to bookmark_path(@bookmark)
      else
        render :new
      end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to bookmark_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
