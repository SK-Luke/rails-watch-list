class BookmarksController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    movie = Movie.find(params[:movie_id])
    list_id = params.require(:bookmark).permit(:list_id)
    list = List.find(list_id["list_id"])
    @bookmark.movie = movie
    @bookmark.list = list
    @bookmark.save
    if @bookmark.save
      redirect_to list_path(@bookmark.list_id)
    else
      render :new
    end
  end

  def destroy
    params.permit(:movie_id)
    @bookmark = Bookmark.find(params[:movie_id])
    @bookmark.destroy

    redirect_to list_path(@bookmark.list_id)
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
