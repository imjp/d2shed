class CharactersController < ApplicationController 
	def new
    @user = User.find(params[:user_id])
		@account = Account.find(params[:account_id])
		@character = Character.new
		
	end
	
  def create
    @user = User.find(params[:user_id])
		@account = Account.find(params[:account_id])
    @character = @account.characters.create(params[:character])
    redirect_to root_url
  end

  def destroy
  end
end