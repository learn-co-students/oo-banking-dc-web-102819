class Transfer
  # self right here is Transfer Class
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid? # don't need to write == true bc if valid? then that means it's true
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == "pending" && self.valid? && @sender.balance >= @amount
      @sender.balance -= @amount # @sender.balance = @sender.balance - amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end