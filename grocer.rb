def consolidate_cart(cart)
  new_hash = {}
  cart.each do |grocery_item|
    grocery_item.each do |name, info|
     if new_hash[name]
       new_hash[name][:count] += 1
     else 
       new_hash[name] = info
       new_hash[name][:count] = 1
     end
    end
  end
  return new_hash
end

def apply_coupons(cart, coupons)
  new_hash = {}
  cart.each do |grocery_item, value|
    coupons.each do |n|
      if grocery_item == n[:item] && value[:count] >= n[:num]
        cart[grocery_item][:count] = cart[grocery_item][:count] - n[:num]

        if new_hash[grocery_item + " W/COUPON"]
          new_hash[grocery_item  + " W/COUPON"][:count] += n[:num] 
        else 
          new_hash[grocery_item + " W/COUPON"] = {:price => n[:cost]/n[:num], :clearance => cart[grocery_item][:clearance], :count => n[:num]}
        end
      end
    end
    new_hash[grocery_item] = value
  end
    return new_hash
end



def apply_clearance(cart)
  cart.each do |grocery_item, value|
    if value[:clearance] == true
      value[:price] = value[:price] - value[:price] * 0.20
    end
  end
  return cart 
end


def checkout(cart, coupons)
  puts cart 
  puts "********************"
  new_cart = consolidate_cart(cart)
  puts new_cart
  puts"@@@@@@@@@@@@@@@@@@@@@@@@"
  new_new_cart = apply_coupons(new_cart,coupons)
  puts new_new_cart
  puts "$$$$$$$$$$$$$$$$$$$$$$$"
end
