$LOAD_PATH << '.'
require 'bankaccount'

class User

  def initialize
    puts 'Welcome to the Banking application'
    @bank = BankAccount.new 
    choices
  end

  def choices
    puts '1. Open New Bank Account'
    puts '2. Withdraw Amount' 
    puts '3. Deposit Amount'
    puts '4. Check Balance'
    puts '5. View Transactions'
    puts '6. Close Account'
    enter_choice    
  end

  def want_to_continue 
    puts 'Press y or n to continue or exit'
    choice = gets.chomp
    if choice == 'y'
      enter_choice
    elsif choice =='n' 
      exit
    else
      puts 'Enter a valid option'
      want_to_continue 
    end 
  end

  def select_choice(choice) 
    case choice
    when 1
      print 'Enter your name:' 
      name = gets.chomp
      if is_string?(name)
        @bank.open_account(name)
        puts 'Account Successfully opened'
        want_to_continue
      else
        puts 'name must be a string'
        select_choice(1)  
      end  
    when 2
      account_number = enter_account_details
      if @bank.account_exist?(account_number)
        BankAccount.check_pin(account_number)
        amount = check_amount
        @bank.withdraw(account_number, amount) 
        want_to_continue     
      else
        puts 'Plz create the account first'
        want_to_continue
      end
    when 3 
      account_number = enter_account_details 
      if @bank.account_exist?(account_number)
        BankAccount.check_pin(account_number)
        amount = check_amount
        @bank.deposit(account_number, amount)  
        want_to_continue     
      else
        puts 'Plz create the account first'
        want_to_continue
      end  
    when 4 
      account_number = enter_account_details
      if @bank.account_exist?(account_number)
        BankAccount.check_pin(account_number)
        @bank.balance(account_number)
        want_to_continue
      else
        puts 'Plz create the account first'
        want_to_continue      
      end  
    when 5
      account_number = enter_account_details    
      if @bank.account_exist?(account_number)
        BankAccount.check_pin(account_number)
        @bank.view_transactions(account_number)
        want_to_continue
      else
        puts 'Plz create the account first'
        enter_choice
      end    
    when 6
      account_number = enter_account_details 
      if @bank.account_exist?(account_number)
        BankAccount.check_pin(account_number)
        @bank.close_account(account_number)
        puts 'Account Successfully closed.'
        want_to_continue
      else 
        puts 'Plz create the account first'
        want_to_continue
      end
    else
      puts 'Sorry this option is not supported'
      want_to_continue      
    end
  end

  def enter_choice
    print 'Enter the choice:'
    choice = gets.chomp
    if User.is_number?(choice)
      select_choice(choice.to_i)
    else
      puts 'choose a valid option from the menu'
      enter_choice
    end  
  end  

  def is_string? string
    false if Float(string) rescue true  
  end

  def self.is_number? string
    true if Float(string) rescue false
  end

  def check_amount
    puts 'Enter the amount'
    amount = gets.chomp
    if User.is_number?(amount)
      amount.to_i
    else
      puts 'Amount must be a integer' 
      check_amount
    end  
  end 

  def enter_account_details
    puts 'Enter Account Number:' 
    account_number = gets.chomp
    if User.is_number?(account_number)
      account_number.to_s
    else
      puts 'Account number must be an integer'
      enter_account_details
    end          
  end
end
User.new
  