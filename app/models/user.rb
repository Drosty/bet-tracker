class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bets_won, class_name: :Bet, foreign_key: :winner
  has_many :bets_lost, class_name: :Bet, foreign_key: :loser

  def update_total_value
    won = bets_won.to_a.sum(&:value)
    lost = bets_lost.to_a.sum(&:value)
    self.total_value = won-lost
    self.save
  end

end
