class AccountsController < ApplicationController
	def create
    @user = User.find(params[:user_id])
    @account = @user.accounts.create(params[:account])
    redirect_to user_path(@user)
  end
end
