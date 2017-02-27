def entropy(string)
  length = string.length
  counts = string.chars.uniq
                 .map { |c| [c, string.count(c).to_f] }
                 .to_h

  counts.values.reduce(0) do |entropy, count|
    prob = count / length
    entropy - prob * Math.log2(prob)
  end
end
