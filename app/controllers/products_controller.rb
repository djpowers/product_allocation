class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    bucket = if params["loss-button"].present?
      :loss
    elsif params["process-button"].present?
      :process
    elsif params["donation-button"].present?
      :donation
    end

    if product_params[:barcode].present?
      @product = Product.find_by(barcode: product_params[:barcode])
      if @product.update(product_params.compact_blank.merge(bucket:))
        redirect_to new_product_path
      else
        render :new
      end
    else
      if Product.create(product_params.compact_blank.merge(bucket:))
        redirect_to new_product_path
      else
        render :new
      end
    end
  end

  def show
    if @product = Product.find_by(barcode: params[:barcode])
      render json: @product
    else
      head :not_found
    end
  end

  private

  def product_params
    params.require(:product).permit(:barcode, :name, :description, :weight, :bucket)
  end
end
