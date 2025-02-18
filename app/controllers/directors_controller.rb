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

end
