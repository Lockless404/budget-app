class PurchasesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @purchases = @group.group_purchases
  end

  def new
    @group = Group.find(params[:group_id])
    @purchase = Purchase.new
  end

  def create
    @purchase = current_user.purchases.new(name: purchase_params[:name], amount: purchase_params[:amount])
    @group = Group.find(params[:group_id])
    GroupPurchase.create(group: @group, purchase: @purchase)
    if @purchase.save
      flash.notice = 'Purchase was successfully created.'
      redirect_to group_purchases_path(params[:group_id])
    else
      flash.alert = 'Purchase was not created.'
      render :new
    end
  end

  private

  def purchase_params
    params.require(:data).permit(:name, :amount, :group_id)
  end
end
