class MoviesController < ApplicationController
  
  def create
    # params hash looks like: 
    # retrieve user's input from params
    # create a record in the movie table
    # populate each column with the users input
    # Save
    
    # Redirected the user back to the /movies url

  end
  
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
end
