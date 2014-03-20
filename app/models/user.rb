class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bets_created, class_name: :Bet, foreign_key: :init_user
  has_many :bets_challenged, class_name: :Bet, foreign_key: :against_user
  has_many :bets_won, class_name: :Bet, foreign_key: :winner
  has_many :bets_lost, class_name: :Bet, foreign_key: :loser

end
