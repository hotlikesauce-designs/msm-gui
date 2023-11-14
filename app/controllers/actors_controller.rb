class ActorsController < ApplicationController
  
  def create
    # Parameters: {"the_name"=>"Test", "the_dob"=>"1994-05-25", "the_bio"=>"CL test", "the_image"=>""}

    a = Actor.new
    a.name = params.fetch("the_name")
    a.dob = params.fetch("the_dob")
    a.bio = params.fetch("the_bio")
    a.image = params.fetch("the_image")
    a.save

    redirect_to("/actors")

    # retrieve user's input from params
    # create a record in the actor table
    # populate each column with the users input
    # Save
    
    # Redirected the user back to the /actors url

  end

  def destroy
    the_id = params.fetch("an_id")
    matching_records = Actor.where({ :id => the_id})
    the_actor = matching_records.at(0)
    the_actor.destroy
    redirect_to("/movies")
  end
  
  
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
