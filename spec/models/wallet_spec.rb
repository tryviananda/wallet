RSpec.describe Wallet, type: :model do
    it 'should credit the wallet' do
      wallet = Wallet.create(balance: 100.0)
      wallet.credit(50.0)
      expect(wallet.balance).to eq(150.0)
    end
  
    it 'should not allow debit if balance is insufficient' do
      wallet = Wallet.create(balance: 100.0)
      expect { wallet.debit(150.0) }.to raise_error(StandardError, 'Insufficient balance')
    end
  end
  