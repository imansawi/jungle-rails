module ApplicationHelper
  #a method to show the the cart is empty
  def empty?
    cart.size == 0  
  end

 #write the user email, full name on the stripe UI during chekout
 def order_description
  if current_user
    return "#{current_user.first_name} #{current_user.first_name}'s Jungle Order"
  else
    " Jungle Order"    
  end
end

def order_email
  if current_user
    return "#{current_user.email}"
  else
    " "
  end
end

end
