## BASE CONVERSIONS

9.to_s(2)
# => "1001"

111.to_s(16)
# => "6f"

"1001".to_i(2)
# => 9

"6f".to_i(16)
# => 111

0b1001
# => 9

0x6f
# => 111

11.to_s(2)
# => "1011"

11[0]
# => 1

11[1]
# => 1

11[2]
# => 0

11[3]
# => 1


## ASCII

'a'.ord
# => 97

97.chr
# => "a"

## BASIC BINARY OPERATIONS

(0b0100110 & 0b0110101).to_s(2)   # AND
# => "100100"

(0b0100110 | 0b0110101).to_s(2)   # OR
# => "110111"

(0b0100110 ^ 0b0110101).to_s(2)   # XOR
# => "10011"

(~0b1001).to_s(2)                 # NOT
# => "-1010"
# NOTE: We don't get an exact negation because the negative bit was also flipped
#       and negative numbers are stored differently than positive ones.

5 << 1                            # LEFT-SHIFT
# => 10
# NOTE: Left-shifting a binary number is the same as multiplying by two,
#       just like left shifting a decimal number (25) multiplies it by ten (250)

5 >> 1                            # RIGHT-SHIFT
# => 2
# NOTE: Right-shifting is like dividing by two and dropping the remainder!
