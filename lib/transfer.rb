
require 'pry'

class Transfer

  attr_accessor :status 
  attr_reader :sender , :receiver , :amount 
  
  def initialize(sender, receiver , amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount 
    @status = "pending"
    @isvalid = self.valid?
  end 


  def valid? 
        # binding.pry 

         self.sender.valid? && self.receiver.valid?  && @status == "pending" && self.sender.balance >= @amount
         
  end  

  def execute_transaction
      if @isvalid 
        self.sender.balance = self.sender.balance  - @amount 
        self.receiver.balance = self.receiver.balance + @amount 
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end 
  end 


   def reverse_transfer 
    if @status == "complete"
      self.sender.balance = self.sender.balance  + @amount 
      self.receiver.balance = self.receiver.balance - @amount 
      self.status = "reversed"
    else
      "This Transfer cannot be reversed "
    end 
   end 
 

end
