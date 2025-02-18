class ActorsController < ApplicationController
  def list
    render ({ :template => "actors_templates/list" })
  end

  def show
    @a_id = params.fetch("the_id")
    
    matching_records = Actor.where({ :id  => @a_id })
    @a_actor = matching_records.at(0)

    render ({ :template => "actors_templates/show" })
  end

end
