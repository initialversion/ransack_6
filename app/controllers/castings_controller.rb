class CastingsController < ApplicationController
  def index
    @q = Casting.ransack(params[:q])
    @castings = @q.result(:distinct => true).includes(:movie, :actor).page(params[:page]).per(10)

    render("castings/index.html.erb")
  end

  def show
    @casting = Casting.find(params[:id])

    render("castings/show.html.erb")
  end

  def new
    @casting = Casting.new

    render("castings/new.html.erb")
  end

  def create
    @casting = Casting.new

    @casting.movie_id = params[:movie_id]
    @casting.actor_id = params[:actor_id]

    save_status = @casting.save

    if save_status == true
      redirect_to("/castings/#{@casting.id}", :notice => "Casting created successfully.")
    else
      render("castings/new.html.erb")
    end
  end

  def edit
    @casting = Casting.find(params[:id])

    render("castings/edit.html.erb")
  end

  def update
    @casting = Casting.find(params[:id])

    @casting.movie_id = params[:movie_id]
    @casting.actor_id = params[:actor_id]

    save_status = @casting.save

    if save_status == true
      redirect_to("/castings/#{@casting.id}", :notice => "Casting updated successfully.")
    else
      render("castings/edit.html.erb")
    end
  end

  def destroy
    @casting = Casting.find(params[:id])

    @casting.destroy

    if URI(request.referer).path == "/castings/#{@casting.id}"
      redirect_to("/", :notice => "Casting deleted.")
    else
      redirect_to(:back, :notice => "Casting deleted.")
    end
  end
end
