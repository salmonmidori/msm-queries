class ActorController < ApplicationController
 
  def index
    @position = "Actor"
    @persons = Actor.all
    render({ :template => "misc_templates/index" })
  end

  def bio
    @position = "Actor"
    @person_id = params["id"]
    @person = Actor.where({:id => @person_id}).first
    @persons_movies = Character
      .joins("INNER JOIN movies ON movies.id = characters.movie_id") 
      .joins("INNER JOIN directors ON directors.id = movies.director_id")
      .where({:actor_id => @person_id})
      .select("movies.title as title, movies.year AS year, directors.name AS director_name, characters.name AS character_name")
      .to_a
    render({ :template => "actor_templates/bio" })
  end

end
