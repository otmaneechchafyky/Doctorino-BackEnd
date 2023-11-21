class GenresController < ApplicationController
  def index
    @genres = []
    @genres_list = Genre.all
    @genres_list.each do |genre|
      @genres << GenreSerializer.new(genre).serializable_hash[:data][:attributes]
    end
    render json: @genres
  end
end
