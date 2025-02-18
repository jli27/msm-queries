class DirectorsController < ApplicationController
  def list
    render ({ :template => "director_templates/list" })
  end

  def show
    @a_id = params.fetch("the_id")
    matching_records = Director.where({ :id  => @a_id })

    @a_director = matching_records.at(0)

    @matching_movies = Movie.where({ :director_id => @a_director.id })

    render ({ :template => "director_templates/show" })
  end

  def youngest
    @list_of_directors = Director.all.order({ :dob => :desc })
    @youngest = @list_of_directors.at(0)
    @dob = @youngest.dob
    count = 1

    while (@dob == nil) do
      @youngest = @list_of_directors.at(count)
      @dob = @youngest.dob
      count += 1
    end

    render ({ :template => "director_templates/youngest" })
  end

  def eldest
    @list_of_directors = Director.all.order({ :dob => :asc })
    @eldest = @list_of_directors.at(0)
    @dob = @eldest.dob
    count = 1

    while (@dob == nil) do
      @eldest = @list_of_directors.at(count)
      @dob = @eldest.dob
      count += 1
    end

    render ({ :template => "director_templates/eldest" })
  end

end
