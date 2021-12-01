class DriversController < ApplicationController
    
    def index
        @driver = Driver.all
    end 

    def show 
        @driver = Driver.find_by(id: params[:id])
    end 

end
