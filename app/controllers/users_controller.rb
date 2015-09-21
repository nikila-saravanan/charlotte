class UsersController < ApplicationController

  def show

  end

  def destroy
    current_user.artists.destroy(params[:id])
    flash[:success] = "#{Artist.find(params[:id]).name} has been deleted from your favorites."
    redirect_to user_path(current_user.id)
  end

end
