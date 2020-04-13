class Admin::Merchant::ItemsController < Admin::BaseController
  
  def index
    @merchant = Merchant.find(params[:id])
  end

  def update
    merchant = Merchant.find(params[:id])
    item = Item.find(params[:item_id])
    if item.update(item_params)
      flash[:success] = "Item #{item.id} is " + item_active_message(item.active?)
    else
      flash[:error] = item.errors.full_messages.to_sentence
    end
    redirect_to admin_merchant_items_path
  end

    def item_params
    params.permit(:name,:description,:price,:inventory,:image, :active?)
  end

end
