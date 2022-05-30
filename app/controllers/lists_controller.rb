class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def index
    @lists = List.all
  end

  def show
    bookmarks = Bookmark.where("list_id = #{params[:id]}")
    @movies = []
    bookmarks.each { |bookmark| @movies << bookmark.movie }
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    params.permit(:id)
    @list = List.find(params[:id])
    @list.destroy

    redirect_to root_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

  # def review_params
  #   params.require(:review).permit(:content, :rating)
  # end
end
