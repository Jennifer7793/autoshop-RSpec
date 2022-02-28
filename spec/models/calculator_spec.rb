require 'rails_helper'

RSpec.describe Calculator, type: :model do
  describe "滿額打折" do
    let(:calculator) { Calculator.new(1000, 900) }
    it "訂單$1000, 10%折扣金額為$100, 結帳金額為$900" do
      amount = Calculator.new(1000)
      expect(amount.discounted).to eq(100)
      expect(amount.final_total).to eq(900)
    end
    it "原價$900, 無打折無折扣金額, 結帳金額為$900" do
      amount = Calculator.new(900)
      expect(amount.discounted).to eq(0)
      expect(amount.final_total).to eq(900)
    end
  end

  describe "特定商品達數量折扣" do
    xit "特定商品滿3件, 折扣$30" do
      product.promote
      expect(amount.discounted).to eq(30)
      expect(amount.final_total).to eq
    end

    xit "特定商品買2件, 無折扣" do
      expect(amount.discounted).to eq(0)
      expect(amount.final_total).to eq
    end
  end

  describe "滿額送特定商品" do
    xit "滿$1000, 送特定商品" do
      amount = Calculator.new(1000)
      expect(product.freebie).to be_truthy
    end
  end

  describe "滿額折抵金額限用次數" do
    xit "訂單滿$1500, 折扣$200, 結帳金額為$1300, 只能套用1次" do
      amount = Calculator.new(1500)
      expect(amount.discounted).to eq(200)
      expect(amount.final_total).to eq(900)
    end

    xit "訂單$1400, 折扣為$0, 結帳金額為$1400" do
      amount = Calculator.new(1499)
      expect(amount.discounted).to eq(0)
      expect(amount.final_total).to eq(1499)
    end
  end
end
