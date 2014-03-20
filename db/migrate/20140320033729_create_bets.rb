class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.string :description
      t.integer :value
      t.integer :init_user
      t.integer :against_user
      t.integer :winner

      t.timestamps
    end
  end
end
