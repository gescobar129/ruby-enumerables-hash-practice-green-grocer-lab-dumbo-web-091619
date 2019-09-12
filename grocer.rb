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
  
end

def checkout(cart, coupons)
  # code here
end
