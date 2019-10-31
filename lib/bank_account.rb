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
       binding.pry
    end
end
