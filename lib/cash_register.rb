require "pry"

class CashRegister

    attr_accessor :total, :items, :price
    attr_reader :discount

    def initialize(discount = nil)
        @total = 0
        @items = []
        if discount
            @discount = discount
        end
    end

    def add_item(title, price, quantity = 0)
        @price = price
        @quantity = quantity
        if quantity > 0
            quantity.times do
                self.total += price
                items << title
            end
        else
            self.total += price
            items << title
        end
    end

    def apply_discount
        if discount
            puts discount
            puts total
            self.total *= (discount - 100).abs / 100.0
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= self.price

        @quantity.times do |i| 
            @items.pop
        end

        if @items.length == 0
            @total = 0.0
        end
    end

end
