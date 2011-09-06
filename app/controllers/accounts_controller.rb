class AccountsController < ApplicationController
	def show
		@user = User.find(params[:id])
		@account = @user.account
	end
	
	def new	
		@user = User.find(params[:user_id])
		@account = Account.new
		@account.characters.build
	end

	def create
    @user = User.find(params[:user_id])
    @account = @user.accounts.create(params[:account])
    redirect_to user_path(@user)
  end 
	
	def destroy
    @user = User.find(params[:user_id])
		@account = @user.accounts.find(params[:id])
		@account.destroy
		redirect_to user_path(@user)
	end
end
