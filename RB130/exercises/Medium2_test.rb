# cash_register.rb

class CashRegister
  attr_reader :total_money

  def initialize(total_money)
    @total_money = total_money
  end

  def change(transaction)
    transaction.amount_paid - transaction.item_cost
  end

  def give_receipt(transaction)
    puts "You've paid $#{transaction.item_cost}."
  end

  def accept_money(transaction)
    @total_money += transaction.amount_paid
  end

  def start_transaction(transaction)
    transaction.prompt_for_payment
    accept_money(transaction)
    change(transaction)
    give_receipt(transaction)
  end
end

# transaction.rb

class Transaction
  attr_reader :item_cost
  attr_accessor :amount_paid

  def initialize(item_cost)
    @item_cost = item_cost
    @amount_paid = 0
  end

  def prompt_for_payment(input: $stdin, output: $stdout)
    loop do
      output.puts "You owe $#{item_cost}.\nHow much are you paying?"
      @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
      break if valid_payment? && sufficient_payment?
      output.puts 'That is not the correct amount. ' \
           'Please make sure to pay the full cost.'
    end
  end

  private

  def valid_payment?
    amount_paid > 0.0
  end

  def sufficient_payment?
    amount_paid >= item_cost
  end
end


require 'minitest/autorun'

class CashRegisterTest < Minitest::Test
  def setup
    @reg = CashRegister.new(0)
    @transaction = Transaction.new(5)
    @transaction.amount_paid = 50
  end
  
  def test_accept_money 
    result = @reg.accept_money(@transaction)
    assert_equal(50, result)
  end
  
  def test_change
    assert_equal(45, @reg.change(@transaction))
  end
  
  def test_give_receipt
    assert_output("You've paid $5.\n") {@reg.give_receipt(@transaction)}
    # assert_output(/hey/) { method_with_output }
  end
  
  def test_prompt_for_payment
    input = StringIO.new("100\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(100, @transaction.amount_paid)
  end
  
end