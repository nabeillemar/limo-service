class SessionsController < ApplicationController


    def new #this is a GET action generates our login page 
        @user = User.new #creates a new instance of a user class and add it to the instance varaible @user 
        render :new #takes the user to Sessions => New page 
    end 

    def create #this is a POST action the information from our Sessions #new Page (aka login page) gets posted to this create action
        @user = User.find_by(username: params[:user][:username]) #We are searching to the username with the username added in the form and creating a new instance varaible called @user
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to trips_path(@user)
            #redirect_to user_path(@user) #this is the user show page , this should be redirect to the destentation page 
        else
            flash[:error] = "Please try again your username and or password to do match"
            redirect_to '/login'
        end 

    end 


     #omniauth login
  def gitcreate
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.password = auth['uid'] 
    end

    session[:user_id] = @user.id

    redirect_to '/pets'
  end

    def home

    end 

    def destroy 
        session.clear
        redirect_to '/'
    end 


    private 
    def auth
        request.env['omniauth.auth']
      end

end 