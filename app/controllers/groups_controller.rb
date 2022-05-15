class GroupsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @groups = current_user.groups.includes(:group_purchases).includes(:purchases)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(params.require(:data).permit(:name, :icon))
    respond_to do |format|
      format.html do
        if @group.save
          redirect_to groups_path, notice: 'Group successfully created'
        else
          flash.now[:error] = 'Error: Group could not be saved'
          render :new, locals: { group: @group }
        end
      end
    end
  end
end
