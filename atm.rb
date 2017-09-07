class Account
  attr_reader :name, :balance
  def initialize(name, balance=100)
    @name = name
    @balance = balance
    puts "New account created for #{@name}. Balance: $#{@balance}"
  end

  def display_balance(pin_number)
    puts "Requesting balance..."
    puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
  end

  def withdraw(pin_number, amount)
    puts "Requesting withdrawal of $#{amount}..."
    if pin_number == pin
      if @balance >= amount
        @balance -= amount
        puts "Withdrew $#{amount}. New balance: $#{@balance}."
        else
        puts "Error. Withdrawal amount exceeds balance amount. Transaction aborted."
      end
    else
      puts pin_error
    end
  end

  private

  def pin
    @pin = 1111
  end

  def pin_error
    "Access denied: incorrect PIN."
  end
end

this_account = Account.new("Bob", 800_000)
this_account.withdraw(1111, 500_000)
this_account.display_balance(1111)
this_account.withdraw(1111, 500_000)
this_account.display_balance(1111)
this_account.withdraw(1112, 1)
this_account.display_balance(1112)
this_account.display_balance(1111)
