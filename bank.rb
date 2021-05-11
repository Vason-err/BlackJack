class Bank
  attr_reader :total_sum

  def initialize(sum = 0)
    @total_sum = sum
  end

  def take(sum)
    return unless sum?(sum)
    self.total_sum -= sum
    sum
  end

  def put(sum)
    self.total_sum += sum
  end

  def is_empty?
    sum.zero?
  end

  def sum?(sum) #check the availible sum
    self.total_sum >= sum
  end

  private

  attr_writer :sum
end