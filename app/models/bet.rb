class Bet < ActiveRecord::Base

  validate :winning_user_valid
  validate :losing_user_valid
  validate :winner_cant_be_loser

  validates :description, presence: true

  after_save :update_users

  scope :earliest_first, order('bets.created_at DESC')

  def summary
    "#{self.winning_user.name} won $#{self.value} from #{self.losing_user.name} - #{self.description}"
  end

  def winning_user
    User.find_by(id: self.winner)
  end

  def losing_user
    User.find_by(id: self.loser)
  end

private

  def update_users
    self.winning_user.update_total_value
    self.losing_user.update_total_value
  end

  def winning_user_valid
    if self.winner.nil?
      errors.add(:winner, "can't be empty")
      return
    end

    if User.find_by(id: self.winner).nil?
      errors.add(:winner, "was not found, try again")
      return
    end
  end

  def losing_user_valid
    if self.loser.nil?
      errors.add(:loser, "can't be empty")
      return
    end

    if User.find_by(id: self.loser).nil?
      errors.add(:loser, "was not found, try again")
      return
    end
  end

  def winner_cant_be_loser
    if self.winner == self.loser
      errors.add(:winner, "can't be same as loser")
    end
  end

end
