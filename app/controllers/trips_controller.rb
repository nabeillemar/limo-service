class TripsController < ApplicationController
  before_action :check_for_logged_in

    def new #creates new form 
      if params[:driver_id] && driver = Driver.find_by_id(params[:driver_id])
        @trip = driver.trip.build
      else 
       @trip = Trip.new
     end 
    end 

    def create
      @trip = current_user.trips.build(trip_params)
      if @trip.save
        redirect_to trip_path(@trip) #this is suppose to be trips#show 
      else 
        render :new
      end 
      #@trip = Trip.new
      #trip.client_name = params[:client_name]
      #@trip.pick_up = params[:pick_up]
      #@trip.drop_off = params[:drop_off]
      #@trip.save!

      #@trip = Trip.new(trip_params)
      #@trip.save
      #binding.pry
    end 


    def index 
      @user = User.find(session[:user_id])
      @trips = Trip.where(params[:id])

      end 


    #def index #the user should only see their rides that they booked, not sure why it is not working 
     # @trips = Trip.all
      #@users = User.all
      #@trips = Trip.all.find(params[:id])
      #binding.pry
      #@trips = Trip.all.find_by(params[:id])
      #@trips = Trip.where(user_id: == current_user)
     #end 

    def show 
      @trip = Trip.find_by(id: params[:id])
      @user = User.find(session[:user_id])
      if !current_user == @user.id
        redirect_to trip_path(@trip)
    end 
  end 

    def edit
      @trip = Trip.find_by(id: params[:id])
    end 

    def update 
      @trip = Trip.find_by(id: params[:id])
      if @trip.update(trip_params)
        redirect_to trip_path(@trip)
      else
        render :edit 
      end 
    end 

    def destroy 
      @trip = Trip.find_by(id: params[:id])
      @trip.destroy
      redirect_to trips_path
    end 


    private 
    
    def trip_params
        params.require(:trip).permit(:client_name, :pick_up, :drop_off, :reservation_date, :passengers, :pick_up_time, :drop_off_time, :driver_id, driver_attributes:[:name, :car])
    end




end
 
