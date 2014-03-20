class AddLoserToBets < ActiveRecord::Migration
  def change
    add_column :bets, :loser, :integer
  end
end
