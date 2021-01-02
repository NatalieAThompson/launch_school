def greatest_product(str)
  sub_arrays = str.chars.each_cons(5).to_a

  sub_arrays.map! do |sub_ar|
    sub_ar.map! {|ele| ele.to_i}

    sub_ar.reduce(:*)
  end.max
end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0