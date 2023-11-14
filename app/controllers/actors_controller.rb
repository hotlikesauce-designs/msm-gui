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
    redirect_to("/actors")
  end

  def update
    #  Parameters: {"the_title"=>"1", "the_year"=>"2023", "the_duration"=>"3", "the_description"=>"4", "the_image"=>"5", "the_director_id"=>"6", "an_id"=>"1"}

    # get the ID out of params
    a_id = params.fetch("an_id")
    
    # look up the existing record
    matching_records = Actor.where({:id => a_id})
    a = matching_records.at(0)
    
    # overwrite each column with user values
    a.name = params.fetch("the_name")
    a.dob = params.fetch("the_dob")
    a.bio = params.fetch("the_bio")
    a.image = params.fetch("the_image")
    
    # save and redirect 
    a.save
    redirect_to("/actors/#{a.id}")
    
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
