require_relative "transfer.rb"
require 'pry'

class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end

    def self.all
        @@all
    end

    def deposit(money)
        @balance += money
        # binding.pry
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if @balance > 0 && @status == "open"
            true
        else
            false
        end
    end

    def close_account
        self.status = "closed"
    end
end
