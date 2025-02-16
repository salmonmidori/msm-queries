class DirectorController < ApplicationController
 
  def index
    @position = "Director"
    @persons = Director.all.order({:dob => :desc})
    render({ :template => "index_templates/people_index" })
  end

  def detail
    @position = "Director"
    @person_id = params["id"]
    @person = Director.where({:id => @person_id}).first
    @persons_movies = Movie.where({:director_id => @person_id})
    render({ :template => "details_templates/director_details" })
  end

  def show_eldest
    @age_position = "Eldest"
    @person = Director.where.not({:dob => nil}).order({:dob => :desc}).last
    render({ :template => "misc_templates/director_age" })
  end

  def show_youngest
    @age_position = "Youngest"
    @person = Director.where.not({:dob => nil}).order({:dob => :desc}).first
    render({ :template => "misc_templates/director_age" }) 
  end
end
