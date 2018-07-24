require 'errors'
class BankAccount
  include  Errors
  @@user_account_details = {}  
  
  def open_account(name)    
    account_number = generate_account_number
    puts account_number    
    pin = generate_pin
    puts pin
    @@user_account_details.store( "#{account_number}", name: name, amount: 0, pin: pin)   
    @transactions = []
    @@user_account_details 
  end 
  
  def close_account(acc)  
    @@user_account_details.delete("#{acc}")
  end 
  
  def withdraw(acc, amount)
    if amount > @@user_account_details["#{acc}"][:amount]
      puts "#{no_money[@less_money]}"
    else      
      add_transaction(acc,-amount)
      @@user_account_details["#{acc}"][:amount]-= amount
      puts "Withdraw #{amount}. New balance: $#{@@user_account_details["#{acc}"][:amount]}." 
    end 
  end
  
  def deposit(acc,amount)  
    add_transaction(acc, amount)
    @@user_account_details["#{acc}"][:amount] += amount
    puts "Deposited #{amount}. New balance: $#{@@user_account_details["#{acc}"][:amount]}."
  end
  
  def view_transactions(acc)  
    if @transactions.any?
      puts @transactions
    else
      puts 'you dont have any transactions' 
    end
 end 
  
  def add_transaction(acc, amount)
    @transactions.push(acc,amount)
  end   
  
  def balance(acc)
    puts @@user_account_details["#{acc}"][:amount]  
  end 
  
  def account_exist?(account_number)  
    if @@user_account_details.include?(account_number)    
      account_number   
    else
      puts "account does not exist"
    end  
  end  
  
  private
  
  def generate_pin
    rand(6**6)
  end

  def self.pin_error
    puts 'Access denied: incorrect PIN.'
  end 
  
  def generate_account_number
    rand(10**10)
  end

  def self.check_pin(acc)
    puts 'enter the pin'
    pinnum = gets.chomp
    if User.is_number?(pinnum) && pinnum == @@user_pin["#{acc}"][:pin].to_s
      return   
    else
      BankAccount.pin_error
      BankAccount.check_pin(acc)
    end
  end  
end    
  