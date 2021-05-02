module ApplicationHelper
  #a method to show the the cart is empty
  def empty?
    cart.size == 0  
  end
end
