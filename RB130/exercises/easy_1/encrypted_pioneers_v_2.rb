BEGIN_ALP = Array('A'..'M') + Array('a'..'m')
END_ALP = Array('N'..'Z') + Array('n'..'z')

def convert(word)
  word.chars.map do |char|
    if BEGIN_ALP.include?(char)
      END_ALP[BEGIN_ALP.index(char)]
    elsif END_ALP.include?(char)
      BEGIN_ALP[END_ALP.index(char)]
    else
      char
    end
  end.join
end

def translate(ar)
  ar.each_line do |word|
    puts convert(word)
  end
end

translate("Nqn Ybirynpr,
Tenpr Ubccre,
Nqryr Tbyqfgvar,
Nyna Ghevat,
Puneyrf Onoontr,
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv,
Wbua Ngnanfbss,
Ybvf Unvog,
Pynhqr Funaaba,
Fgrir Wbof,
Ovyy Tngrf,
Gvz Orearef-Yrr,
Fgrir Jbmavnx,
Xbaenq Mhfr,
Fve Nagbal Ubner,
Zneiva Zvafxl,
Lhxvuveb Zngfhzbgb,
Unllvz Fybavzfxv,
Tregehqr Oynapu")