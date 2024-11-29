class Transaction < ApplicationRecord
    belongs_to :source_wallet, class_name: 'Wallet', optional: true
    belongs_to :target_wallet, class_name: 'Wallet', optional: true
  
    validates :amount, numericality: { greater_than: 0 }
    validate :validate_wallets
  
    private
  
    def validate_wallets
      if source_wallet.nil? && target_wallet.nil?
        errors.add(:base, 'At least one wallet must be present')
      end
    end
  end
  