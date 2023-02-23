# [A, A, A, A, B, C, D, D]
(0.5) * Math.log2(0.5) +
(0.125) * Math.log2(0.125) +
(0.125) * Math.log2(0.125) +
(0.25) * Math.log2(0.25)

# [A, B, C, D]
-4 * (0.25) * Math.log2(0.25)

# unidiomatic ruby entropy method
def entropy(string)
  e = 0
  sz = string.bytesize.to_f
  b = string.bytes
  0.upto(255) do |i|
    x = b.count(i)/sz
    if x > 0
      e += -x * Math.log2(x)
    end
  end
  e
end

# idiomatic ruby entropy method
def entropy(string)
  string
    .chars.uniq
    .map { |c| string.count(c).to_f }
    .reduce(0) do |entropy, count|
      prob = count / string.length
      entropy - prob * Math.log2(prob)
    end
end

# entropy('aaaabcdd') == 1.75
# entropy('abcd')    == 2.00
