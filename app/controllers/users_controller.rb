class UsersController < ApplicationController
 

  def new
    @user = User.new
  end

  
 def create
    # Instantiate a new object using form parameters
    @user = User.new(user_params)
    # Save the object
    if @user.save
      flash[:notice] = "You are registered"
      redirect_to(:action => 'new')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end
 def user_params
    params.require(:user).permit(:name, :college, :year, :department, :mobile, :email)
  end
end
