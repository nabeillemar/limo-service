class ApplicationController < ActionController::Base 
    include ApplicationHelper


    def current_user 
      @current_user ||= User.find_by_id(session[:user_id])
    end



  
    def logged_in? 
      !!session[:user_id]
    end


    private
    def check_for_logged_in
      redirect_to '/' if !logged_in?
    end

    
end
