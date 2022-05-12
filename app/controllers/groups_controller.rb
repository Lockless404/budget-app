class GroupsController < ApplicationController
  def index
    @user = current_user
    @group = Group.where(user_id: current_user.id)
  end

  def new
    @group = Group.new
  end

  def create; end
end
