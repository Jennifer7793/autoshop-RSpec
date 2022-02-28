class Calculator
  attr_reader :amount
  def initialize(amount)
    @amount = amount
  end

  def discounted
    if amount < 1000
      @discounted_amount = 0
    elsif amount >= 1000 && amount < 1500
      @discounted_amount = amount * 0.1
    elsif amount >= 1500
      @discounted_amount = 200
    end
  end

  def final_total
    discounted
    @amount -= @discounted_amount
  end
end