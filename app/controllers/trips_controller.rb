class TripsController < ApplicationController
  before_action :check_for_logged_in

    def new 
       @trip = Trip.new
    end 


    def create 
      @trip = current_user.trips.build(trip_params) 
      if @trip.save
        redirect_to trip_path(@trip) 
      else 
        render :new
      end 
    end 

    def index 
      @user = current_user 
      @trips = Trip.where(params[:id])

      end 


 def show 
    @user = current_user 
    @trip = Trip.find_by(id: params[:id])
    if  @user.id != @trip.user_id  
      redirect_to trips_path
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
 
