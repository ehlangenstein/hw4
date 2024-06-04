class PlacesController < ApplicationController

  def index
    @places = Place.all
    
  end

  def show
    @user = User.find_by({ "id" => session["user_id"] })
    if @user != nil 
      @place = Place.find_by({ "id" => params["id"] })
      @entries = Entry.where({ "place_id" => @place["id"] })
    else 
      flash["notice"] = "Login first."
    end 
  
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    # @place["user_id"]
    @place.save
    redirect_to "/places"
  end

end
