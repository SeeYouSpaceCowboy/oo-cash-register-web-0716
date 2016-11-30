class CashRegister
  attr_accessor :discount, :total
  attr_reader :items, :quantity, :price

  def initialize(employee_discount = 0)
    @items = []
    @total = 0
    @discount = employee_discount
  end

  def add_item(title, price, quantity = 1)
    @price = price
    @quantity = quantity

    quantity.times { items.push(title) }
    self.total += price*quantity
  end

  def apply_discount
    if discount != 0
      self.total = total*((100-discount)/100.to_f)
      "After the discount, the total comes to $#{total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    quantity.times{ items.pop }
    self.total -= price*quantity
  end
end
