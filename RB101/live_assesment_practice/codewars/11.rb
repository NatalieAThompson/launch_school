# 11.Extract the domain name from a URL
# (https://www.codewars.com/kata/514a024011ea4fb54200004b/train/ruby)
# 5 kyu
=begin
Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. For example:

domain_name("http://github.com/carbonfive/raygun") == "github" 
domain_name("http://www.zombie-bites.com") == "zombie-bites"
domain_name("https://www.cnet.com") == "cnet"
=end

def domain_name(url)
  url.split("http://").join.split("https://").join.split("www.").join.split(".")[0]
end

p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"
