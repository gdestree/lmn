class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @total_opened = Item.where(event:"open").length 
    @total_clicked = Item.where(event:"click").length

    #Add code for statistics for email type - ORDER
    open_order= Item.where(email_type:"Order", event: "open").length
    click_order= Item.where(email_type:"Order", event: "click").length
    total_order= Item.where(email_type:"Order").length
    @open_rate_order= open_order.to_f/total_order
    @click_rate_order= click_order.to_f/total_order

    #Add code for statistics for email type -SHIPMENT
    open_ship= Item.where(email_type:"Shipment", event: "open").length
    click_ship= Item.where(email_type:"Shipment", event: "click").length
    total_ship= Item.where(email_type:"Shipment").length
    @open_rate_shipment= open_ship.to_f/total_ship
    @click_rate_shipment= click_ship.to_f/total_ship

    #Add code for statistics for email type -DISCOUNT
    open_discount= Item.where(email_type:"GetABookDiscount", event: "open").length
    click_discount= Item.where(email_type:"GetABookDiscount", event: "click").length
    total_discount= Item.where(email_type:"GetABookDiscount").length
    @open_rate_discount= open_discount.to_f/total_discount
    @click_rate_discount= click_discount.to_f/total_discount

    #Add code for statistics for email type -CONFIRM
    open_confirm= Item.where(email_type:"UserConfirmation", event: "open").length
    click_confirm = Item.where(email_type:"UserConfirmation", event: "click").length
    total_confirm= Item.where(email_type:"UserConfirmation").length
    @open_rate_confirm= open_confirm.to_f/total_confirm
    @click_rate_confirm= click_confirm.to_f/total_confirm

    #Add code for statistics for email type -REFER
    open_refer= Item.where(email_type:"ReferAFriend", event: "open").length
    click_refer= Item.where(email_type:"ReferAFriend", event: "click").length
    total_refer= Item.where(email_type:"ReferAFriend").length
    @open_rate_refer= open_refer.to_f/total_refer
    @click_rate_refer= click_refer.to_f/total_refer
  end
  
  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
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
