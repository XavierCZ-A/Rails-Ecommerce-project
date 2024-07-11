class SellerController < ApplicationController
  before_action :authenticate_user!
  layout 'seller'
  def home
  end


end
