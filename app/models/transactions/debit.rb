class Debit < Transaction
    before_save :update_source_balance
  
    private
  
    def update_source_balance
      source_wallet.debit(amount)
    end
  end
  