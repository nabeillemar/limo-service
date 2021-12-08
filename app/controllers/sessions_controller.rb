class SessionsController < ApplicationController


    def new 
        @user = User.new 
        render :new #takes the user to Sessions => New page 
    end 

    def create #this is a POST action the information from our Sessions #new Page (aka login page) gets posted to this create action
        @user = User.find_by(username: params[:user][:username]) 
        if @user && @user.authenticate(params[:user][:password]) 
            session[:user_id] = @user.id 
            redirect_to trips_path(@user) 
        else
            flash[:error] = "Please try again your username and or password to do match" 
            redirect_to '/login'
        end 

    end 



  def gitcreate
    @user = User.from_omniauth(auth) 
    #debugger
    #@user.save #might have to take this off or add a conditional 
    session[:user_id] = @user.id
    #debugger
    redirect_to trips_path(@user)
  end 


    #logout 
    def destroy 
        session.clear
        redirect_to '/'
    end 


    private 
    def auth
        request.env['omniauth.auth']
      end

end 