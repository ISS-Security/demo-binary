# frozen_string_literal: true

require 'date'

# Class that holds a date, bit-packed into an integer
class DatePack
  ## BINARY MASKS AND CONSTANTS
  YEAR_BITS       = 9
  MONTH_BITS      = 5

  YEAR_MASK       = 0b11111111111111000000000
  MONTH_MASK      = 0b00000000000000111100000
  DAY_MASK        = 0b00000000000000000011111

  ZERO_YEAR_MASK  = 0b00000000000000111111111
  ZERO_MONTH_MASK = 0b11111111111111000011111
  ZERO_DAY_MASK   = 0b11111111111111111100000

  def initialize(date)
    pack_date(date)
  end

  def packed
    @packed
  end

  ## PACK BITS
  def pack_date(date)
    @packed = date.year << YEAR_BITS
    @packed |= date.month << MONTH_BITS
    @packed |= date.day
  end

  ## UNPACK BITS
  def year
    (@packed & YEAR_MASK) >> YEAR_BITS
  end

  def month
    (@packed & MONTH_MASK) >> MONTH_BITS
  end

  def day
    (@packed & DAY_MASK)
  end

  def date
    Date.new(year, month, day)
  end

  ## CHANGE BITS
  def year=(new_year)
    @packed = (@packed & ZERO_YEAR_MASK) | (new_year << YEAR_BITS)
  end

  def month=(new_month)
    @packed = (@packed & ZERO_MONTH_MASK) | (new_month << MONTH_BITS)
  end

  def day=(new_day)
    @packed = (@packed & ZERO_DAY_MASK) | new_day
  end
end

pd = DatePack.new(Date.today)
# => #<DatePack:0x007fdf7f8aa280 @packed=1032791>

pd.packed
# => 1032791

pd.year
# => 2017

pd.month
# => 2

pd.day
# => 23

pd.month = 3
# => 3

pd.packed
# => 1032823

pd.date
# => #<Date: 2017-03-23 ((2457836j,0s,0n),+0s,2299161j)>
