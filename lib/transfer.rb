require_relative "bank_account.rb"
require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @@all << self
  end

  def self.all
    @@all
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    end
  end

  def execute_transaction
    if @sender.balance > @amount && @sender.status == "open" && @receiver.status == "open" && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      # binding.pry
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
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
