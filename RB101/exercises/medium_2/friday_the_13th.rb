def friday_13th(year)
  months = *(1..12)
  
  number_of_fridays = 0
  
  months.each do |month|
    t = Time.local(year, month, 13)
    number_of_fridays += 1 if t.friday?
  end
  number_of_fridays
end


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2