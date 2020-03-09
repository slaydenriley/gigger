class GenresController < ApplicationController
  def new
    @genre = Genre.news
  end

  def create
  end

  def show
    @genre = Genre.find_by_id(params[:id])
  end

  def edit
    @genre = Genre.find_by_id(params[:id])
  end

  def update
  end

  def delete
  end
end
