class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :create_cart

  private

  def create_cart
    @cart = Cart.build_from_hash(session) || Cart.new
    puts "~~~~2 #{@cart}"
  end
end
