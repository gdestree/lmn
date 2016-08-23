class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @total_opened = Item.opened
    @total_clicked = Item.clicked

    #Add code for statistics for email type - ORDER
    open_order= Item.statistics("Order", "open")
    click_order= Item.statistics("Order", "click")
    total_order= Item.total_email_type("Order")
    @open_rate_order= open_order.to_f/total_order
    @click_rate_order= click_order.to_f/total_order

    #Add code for statistics for email type -SHIPMENT
    open_ship= Item.statistics("Shipment", "open")
    click_ship= Item.statistics("Shipment", "click")
    total_ship= Item.total_email_type("Shipment")
    @open_rate_shipment= open_ship.to_f/total_ship
    @click_rate_shipment= click_ship.to_f/total_ship

    #Add code for statistics for email type -DISCOUNT
    open_discount= Item.statistics("GetABookDiscount", "open")
    click_discount= Item.statistics("GetABookDiscount", "click")
    total_discount= Item.total_email_type("GetABookDiscount")
    @open_rate_discount= open_discount.to_f/total_discount
    @click_rate_discount= click_discount.to_f/total_discount

    #Add code for statistics for email type -CONFIRM
    open_confirm= Item.statistics("UserConfirmation", "open")
    click_confirm = Item.statistics("UserConfirmation", "click")
    total_confirm= Item.total_email_type("UserConfirmation")
    @open_rate_confirm= open_confirm.to_f/total_confirm
    @click_rate_confirm= click_confirm.to_f/total_confirm

    #Add code for statistics for email type -REFER
    open_refer= Item.statistics("ReferAFriend", "open")
    click_refer= Item.statistics("ReferAFriend", "click")
    total_refer= Item.total_email_type("ReferAFriend")
    @open_rate_refer= open_refer.to_f/total_refer
    @click_rate_refer= click_refer.to_f/total_refer
  end

  # Creating Items with the webhook call
  def receive
    data= []
    # application/x-www-form-urlencoded
    data << request.body.read
    a = JSON.parse(data[0])
    b = Item.create(address: a["Address"], email_type: a["EmailType"], event: a["Event"], time_of_event: a["Timestamp"])
    render nothing: true
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:address, :email_type, :event, :time_of_event)
    end
end
