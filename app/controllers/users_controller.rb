class UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @user = current_user
  end
end
