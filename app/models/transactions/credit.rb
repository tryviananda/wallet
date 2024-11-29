class Credit < Transaction
    before_save :update_target_balance
  
    private
  
    def update_target_balance
      target_wallet.credit(amount)
    end
  end
  