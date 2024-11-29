create_table :wallets do |t|
    t.references :entity, polymorphic: true, null: false
    t.decimal :balance, precision: 15, scale: 2, default: 0.0
    t.timestamps
  end
  