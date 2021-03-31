def compute
  puts block_given? ? yield : 'Does not compute.'
end

compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'