# [A, A, A, A, B, C, D, D]
0.5   * Math.log2(0.5) +
0.125 * Math.log2(0.125) +
0.125 * Math.log2(0.125) +
0.25  * Math.log2(0.25)

# [A, B, C, D]
-4 * (0.25) * Math.log2(0.25)

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

entropy('aaaabcdd')
entropy('abcd')
