class Admin::DashboardController < Admin::BaseController

  def show
    @num_products = Product.count
    @num_categories = Category.count
  end
end