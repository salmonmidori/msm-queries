class DirectorController < ApplicationController
 
  def index
    @position = "Director"
    @persons = Director.all.order({:dob => :desc})
    render({ :template => "misc_templates/people_index" })
  end

  def bio
    @position = "Director"
    @person_id = params["id"]
    @person = Director.where({:id => @person_id}).first
    @persons_movies = Movie.where({:director_id => @person_id})
    render({ :template => "director_templates/bio" })
  end

  def show_eldest
    @age_position = "Eldest"
    @person = Director.where.not({:dob => nil}).order({:dob => :desc}).last
    render({ :template => "director_templates/age" })
  end

  def show_youngest
    @age_position = "Youngest"
    @person = Director.where.not({:dob => nil}).order({:dob => :desc}).first
    render({ :template => "director_templates/age" }) 
  end
end
