class MoviesController < ApplicationController
  def index
    @q = Movie.ransack(params[:q])
    @movies = @q.result(:distinct => true).includes(:director, :castings, :cast).page(params[:page]).per(10)

    render("movies/index.html.erb")
  end

  def show
    @casting = Casting.new
    @movie = Movie.find(params[:id])

    render("movies/show.html.erb")
  end

  def new
    @movie = Movie.new

    render("movies/new.html.erb")
  end

  def create
    @movie = Movie.new

    @movie.title = params[:title]
    @movie.duration = params[:duration]
    @movie.rating = params[:rating]
    @movie.description = params[:description]
    @movie.director_id = params[:director_id]
    @movie.showtime = params[:showtime]
    @movie.released_on = params[:released_on]
    @movie.best_picture = params[:best_picture]

    save_status = @movie.save

    if save_status == true
      redirect_to("/movies/#{@movie.id}", :notice => "Movie created successfully.")
    else
      render("movies/new.html.erb")
    end
  end

  def edit
    @movie = Movie.find(params[:id])

    render("movies/edit.html.erb")
  end

  def update
    @movie = Movie.find(params[:id])

    @movie.title = params[:title]
    @movie.duration = params[:duration]
    @movie.rating = params[:rating]
    @movie.description = params[:description]
    @movie.director_id = params[:director_id]
    @movie.showtime = params[:showtime]
    @movie.released_on = params[:released_on]
    @movie.best_picture = params[:best_picture]

    save_status = @movie.save

    if save_status == true
      redirect_to("/movies/#{@movie.id}", :notice => "Movie updated successfully.")
    else
      render("movies/edit.html.erb")
    end
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy

    if URI(request.referer).path == "/movies/#{@movie.id}"
      redirect_to("/", :notice => "Movie deleted.")
    else
      redirect_to(:back, :notice => "Movie deleted.")
    end
  end
end
