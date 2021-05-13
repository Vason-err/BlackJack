class Dealer < Player

  MAX_POINT = 17
  
  def max_point
    MAX_POINT
  end

  def can_take?
    return true if points < max_point
  end
end