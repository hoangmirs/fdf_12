class CartsController < ApplicationController
  before_action :load_product, only: [:update, :edit, :destroy]

  def index
  end

  def update
    @cart.add_item params[:id]
    session["cart-#{@product.shop.id}"] = @cart.sort
  end

  def edit
    item = @cart.find_item params[:id]
    if item.quantity > 1
      item.decrement
      session["cart-#{@product.shop.id}"] = @cart.sort
    end
    respond_to do |format|
      format.js {render :update}
    end
  end

  def destroy
    cart = session["cart-#{@product.shop.id}"]
    item = cart["items"].find{|item| item["product_id"] == params[:id]}
    if item
      cart["items"].delete item
      create_cart
    end
    respond_to do |format|
      format.js {render :update}
    end
  end

  private
  def load_product
    @product = Product.find_by id: params[:id]
  end
end
