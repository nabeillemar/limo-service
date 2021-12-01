class UsersController < ApplicationController

    def new  #this creates our Sign up form which is in new.html.erb
        @user = User.new
    end 

    def create # the form in new.html.erb gets posted to this and then gets redirect to either show page or the new page 
        @user = User.new(user_params)
       if @user.save
        session[:user_id] = @user.id 
        render :show #this should be the dashboard or the destentation path 
       else
        flash[:error] = "Please pick a unique email address and username"
        render :new
    end 
end 

private 

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 

end
