require_relative 'insufficient_funds_error'

module Bank
  class Account
    attr_reader :id, :balance
    def initialize(id, balance)
      if balance < 0
        raise ArgumentError.new("Initial balance must be positive (got #{balance})")
      end

      @id = id
      @balance = balance
    end

    def withdraw(amount)
      # begin
      #   @balance -= amount
      # rescue ArgumentError => e
      #   puts "Error: #{e.message}"
      # rescue InsufficientFundsError => e
      #   puts "Error: #{e.message}"
      # end
      #
      #
      #
      #

      if amount < 0
        raise ArgumentError.new("Cannot withdraw a negative amount (got #{amount})")
      end

      if @balance - amount < 0
        # puts "Cannot withdraw; balance would go negative"
        raise InsufficientFundsError.new("Not enough funds to withdraw")
      end

      @balance -= amount

    end

    def deposit(amount)
      if amount < 0
        raise ArgumentError.new("Cannot withdraw a negative amount (got #{amount})")
      end

      @balance += amount
    end
  end
end
