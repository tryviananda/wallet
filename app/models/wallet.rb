class Wallet < ApplicationRecord
    belongs_to :entity, polymorphic: true
  
    # Validasi saldo tidak negatif
    validates :balance, numericality: { greater_than_or_equal_to: 0 }
  
    # Metode untuk menambahkan atau mengurangi saldo
    def credit(amount)
      update!(balance: balance + amount)
    end
  
    def debit(amount)
      raise StandardError, "Insufficient balance" if balance < amount
  
      update!(balance: balance - amount)
    end
  end
  