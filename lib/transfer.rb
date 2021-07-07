class Transfer
 attr_accessor :sender, :receiver, :status, :amount
  # Initialize with sender, receiver, status = pending, transfer ampount.
  # Three arguments: sender, receiver, amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  #valid?: Check if sender.status == open and receiver.status == open account
  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  #exectute_transaction: transfer money from sender to receiver
  #transfer only happen once
  #rejects if sender does not have enough
  def execute_transaction
    if self.sender.balance > self.amount && self.status == "pending" && self.valid?
      self.receiver.deposit(self.amount)
      self.sender.deposit(-self.amount) 
      self.status = "complete"
    else
      self.status = "rejected" 
      "Transaction rejected. Please check your account balance."
    end
  end


  #reverse_transfer: reverses an executed transfer
  def reverse_transfer
    if self.status == "complete"
      self.receiver.deposit(-self.amount)
      self.sender.deposit(self.amount)
      self.status = "reversed"
    end
  end

end
