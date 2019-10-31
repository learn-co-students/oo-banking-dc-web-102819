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
    @sender.balance -= @amount
    @receiver.balance += @amount
    # binding.pry
    
  end

end
