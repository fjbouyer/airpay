class OrdersController < ApplicationController

  def new
    @products = {}
    categories = ProductCategory.all
    categories.each do |category|
      @products[category] = Product.where(product_category_id: category.id)
    end
  end

end
