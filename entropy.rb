# def entropy(string)
#   counts = string.chars.uniq
#                  .map { |c| string.count(c).to_f }

#   counts.reduce(0) do |entropy, count|
#     prob = count / string.length
#     entropy - prob * Math.log2(prob)
#   end
# end

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
