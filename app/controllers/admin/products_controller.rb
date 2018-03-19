class Admin::ProductsController < ApplicationController

before_action :set_product, only: [:show, :edit, :update, :destroy]

def index
  @products = Product.page(params[:page]).per(10)
end


def new
  @product = Product.new
end

def create
  @product = Product.new(product_params)
  if @product.save
    flash[:notice] = "Product was created successfully!"
    redirect_to admin_products_path
  else
    flash[:alert] = "Product was failed to be created"
    render :new
  end
end

def show

end

def edit

end

def update
  if @product.update(product_params)
    flash[:notice] = "Product was updated successfully!"
    redirect_to admin_products_path
  else
    flash[:alert] ="Product was failed to be updated"
    render :edit
  end
end

def destroy
   @product.destroy
   redirect_to admin_products_path
   flash[:alert] = "Product was deleted!"

end


private

def set_product
  @product = Product.find(params[:id])
end

def product_params
  params.require(:product).permit(:name, :price, :description, :image)
end


end
