class GroupsController < ApplicationController
  def index
    @user = current_user
    @groups = Group.where(user_id: current_user.id)
  end

  def new
    @user = current_user
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(params.require(:groups).permit(:name, :icon))
    respond_to do |format|
      format.html do
        if @group.save
          redirect_to user_groups_path(@group.user), notice: 'Group successfully created'
        else
          flash.now[:error] = 'Error: Group could not be saved'
          render :new, locals: { group: @group }
        end
      end
    end
  end
end
