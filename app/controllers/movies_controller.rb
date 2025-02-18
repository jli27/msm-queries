class MoviesController < ApplicationController
  def list
    render ({ :template => "movies_templates/list" })
  end

  def show
    @a_id = params.fetch("the_id")
    matching_records = Movie.where({ :id  => @a_id })

    @a_movie = matching_records.at(0)

    matching_records_d = Director.where({ :id  => @a_movie.director_id })
    @the_director = matching_records_d.at(0)

    render ({ :template => "movies_templates/show" })
  end

end
