class ProductsController < ApplicationController
  def new
  end

  def show
    if @product = Product.find_by(barcode: params[:barcode])
      render json: @product
    else
      head :not_found
    end
  end
end
