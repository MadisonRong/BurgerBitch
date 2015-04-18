class UsersController < BurgerBitchController
  def edit
    ***REMOVED*** if current_user.id == params[:id]
    ***REMOVED***   @user = User.find(params[:id])
    ***REMOVED*** else
    ***REMOVED***   redirect_to root_path
    ***REMOVED*** end
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(user_params)
      redirect_back_or root_path
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:real_name)
    end
end
