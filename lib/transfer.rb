class Transfer
  require 'pry'
  attr_accessor :amount
  attr_reader :sender, :receiver, :status

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount= amount
    end

    def valid?
      sender.valid? && receiver.valid?
    end

    def execute_transaction

      if !valid? || sender.balance < @amount
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      elsif @status !="complete" && @status !="rejected"
        sender.balance = sender.balance - amount
        receiver.balance = receiver.balance + amount
        @status = "complete"
      end

    end

    def reverse_transfer

      if @status =="complete" 
        receiver.balance = receiver.balance - amount
        sender.balance = sender.balance + amount
        @status = "reversed"
      end

    end

end
