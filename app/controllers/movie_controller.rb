class MovieController < ApplicationController
 
  def index
    @position = "Movie"
    @movies = Movie
             .order({:year => :desc, :title => :asc})
             .joins("INNER JOIN directors ON directors.id = movies.director_id")
             .select("movies.id AS id, movies.image AS image, movies.title AS title, movies.year AS year, directors.name AS director_name")
             .to_a
    render({ :template => "index_templates/movie_index" })
  end

  def detail
    @position = "Movie"
    @movie_id = params["id"]
    @movie = Movie
            .where(movies: {:id => @movie_id})
            .joins("INNER JOIN directors ON directors.id = movies.director_id")
            .select("movies.id AS id, movies.image AS image, movies.title AS title, movies.year AS year, movies.duration AS duration, movies.description AS description, directors.name AS director_name, movies.created_at as created_at, movies.updated_at as updated_at")
            .first
    render({ :template => "details_templates/movie_details" })
  end


end
