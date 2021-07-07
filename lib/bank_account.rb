class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    #initialize with name (read only), balance and status (read and write)
    #balance = 1000
    #status = 'open'
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    #deposit method: take argument of deposit amount and add to balance
    def deposit(amount)
        self.balance += amount
    end


    #display_balance: "Your balance is $#{balance}."
    def display_balance
        return "Your balance is $#{self.balance}."
    end

    #valid?: is balance > 0 and status == 'open'
    def valid?
        self.balance > 0 && status == "open"
    end

    #close_account: change status to 'closed'
    def close_account
        self.status = "closed"
    end
end
