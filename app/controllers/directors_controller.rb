class DirectorsController < ApplicationController
  def index
    @directors = Director.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@directors.where.not(:address_latitude => nil)) do |director, marker|
      marker.lat director.address_latitude
      marker.lng director.address_longitude
      marker.infowindow "<h5><a href='/directors/#{director.id}'>#{director.created_at}</a></h5><small>#{director.address_formatted_address}</small>"
    end
  end

  def show
    @director = Director.find(params[:id])
  end
end
