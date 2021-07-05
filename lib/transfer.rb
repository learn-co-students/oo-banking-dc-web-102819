class Transfer
  
  attr_reader :sender, :receiver
  attr_accessor :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if @status == 'pending' && @sender.balance > @amount && @sender.status == 'open' && @receiver.status == 'open'
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    else
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status ==  'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    end
  end
end