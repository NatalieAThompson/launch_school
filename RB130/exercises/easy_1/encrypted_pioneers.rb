ALP = Array("A".."Z") + Array("a".."z")

def decript(name)
  split_ar = name.split

  split_ar.map do |word|
    word.chars.map do |char|
      index = ALP.find_index(char)
      if index && (index < 13 || (index > 25 && index < 38))
        index += 13
        ALP[index]
      elsif index && (index > 38 || (index >= 13 && index < 25))
        index -= 13
        ALP[index]
      else
        char
      end
        
    end.join
  end.join(" ")
end

CAP_ALP = Array("A".."Z")

LOW_ALP = Array("a".."z")

def rot13(str)
  str.chars.map do |char|
    case char
    when ("A".."Z") 
      index = CAP_ALP.find_index(char)
      if index + 13 < 26
        CAP_ALP[index + 13]
      else
        CAP_ALP[index - 13]
      end
    when ("a".."z")
      index = LOW_ALP.find_index(char)
      if index + 13 < 26
        LOW_ALP[index + 13]
      else
        LOW_ALP[index - 13]
      end
    else
      char
    end
  end.join("")
end


p rot13("Nqn Ybirynpr")
p rot13("Tenpr Ubccre")
p rot13("Nqryr Tbyqfgvar")
p rot13("Nyna Ghevat")
p rot13("Puneyrf Onoontr")
p rot13("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
p rot13("Wbua Ngnanfbss")
p rot13("Ybvf Unvog")
p rot13("Pynhqr Funaaba")
p rot13("Fgrir Wbof")
p rot13("Ovyy Tngrf")
p rot13("Gvz Orearef-Yrr")
p rot13("Fgrir Jbmavnx")
p rot13("Xbaenq Mhfr")
p rot13("Fve Nagbal Ubner")
p rot13("Zneiva Zvafxl")
p rot13("Lhxvuveb Zngfhzbgb")
p rot13("Unllvz Fybavzfxv")
p rot13("Tregehqr Oynapu")


p decript("Nqn Ybirynpr")
p decript("Tenpr Ubccre")
p decript("Nqryr Tbyqfgvar")
p decript("Nyna Ghevat")
p decript("Puneyrf Onoontr")
p decript("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
p decript("Wbua Ngnanfbss")
p decript("Ybvf Unvog")
p decript("Pynhqr Funaaba")
p decript("Fgrir Wbof")
p decript("Ovyy Tngrf")
p decript("Gvz Orearef-Yrr")
p decript("Fgrir Jbmavnx")
p decript("Xbaenq Mhfr")
p decript("Fve Nagbal Ubner")
p decript("Zneiva Zvafxl")
p decript("Lhxvuveb Zngfhzbgb")
p decript("Unllvz Fybavzfxv")
p decript("Tregehqr Oynapu")
