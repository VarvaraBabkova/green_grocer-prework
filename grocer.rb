require "pry"

def apply_coupons(cart, coupons)
  add_cart = {}
  puts  " all coupons " + coupons.to_s

  coupons.each do |coupon|
    puts
    puts "coupon before - " + coupon.to_s
    puts "cart before " + cart.to_s

    cart.each do |item_name, item_hash|
      if coupon[:item] == item_name
        add_cart[item_name + " W/COUPON"] = {
                                            :price => coupon[:cost],
                                            :clearance => item_hash[:clearance],
                                            :count => ()
                                          }
        item_hash[:count] = item_hash[:count] - coupon[:num]
        coupon[:item] = ""
      end
    end #cart

    puts "coupon after - " + coupon.to_s
    puts "cart after " + cart.to_s
    puts "add_cart after " + add_cart.to_s

  end #coupon
  return cart.merge(add_cart)
end


def consolidate_cart(cart)
  uniq_hash = cart.uniq
  final_hash = {}

  uniq_hash.each do |item|

    item.values[0][:count] = 0
    final_hash[item.keys[0]] = item.values[0]
  end
  cart.each do |item|
    #binding.pry
    final_hash[item.keys[0]][:count] += 1
  end
  return final_hash
end



def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end

#apply_coupons({"AVOCADO"=>{:price=>3.0, :clearance=>true, :count=>5}}, [{:item=>"AVOCADO", :num=>2, :cost=>5.0},
 #{:item=>"AVOCADO", :num=>2, :cost=>5.0}])
