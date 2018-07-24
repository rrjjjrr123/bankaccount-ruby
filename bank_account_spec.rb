$LOAD_PATH << '.'
require 'rspec'
require 'bankaccount'
require 'pry'

describe BankAccount do 
 
  context "When testing the BankAccount" do   
    account_number = "851073978"
    
    before :each do
      @bank = BankAccount.new
    end

    it "The open_account method should return name of account holder " do
      @user_name = @bank.open_account("ronak")
      @account_number = @user_name.keys.first
      @user_name[@account_number][:name].to eq "ronak"
    end

    it "The close_account method should return false" do
      @bank.close_account(account_number)
      expect(@user_name.keys.first.include?(account_number)).to eq false 
    end

    it "The open_account method should return name of account holder " do 
      name = @bank.withdraw()
      expect(name).to eq "ronak"
    end

    it "The open_account method should return name of account holder " do 
      name = @bank.deposit(500)
      expect(name).to eq "ronak"
    end

    it "The open_account method should return name of account holder " do 
      name = @bank.view_transactions(500)
      expect(name).to eq "ronak"
    end

    it "The open_account method should return name of account holder " do 
      name = @bank.balance(acc)
      expect(name).to eq "ronak"
    end

    it "The open_account method should return name of account holder " do 
      name = @bank.balance(acc)
      expect(name).to eq "ronak"
    end

    it "The open_account method should return name of account holder " do 
      name = @bank.account_exist?(acc)
      expect(name).to eq "ronak"
    end

    it "The open_account method should return name of account holder " do 
      name = @bank.account_exist?(acc)
      expect(name).to eq "ronak"
    end
  end
end  
