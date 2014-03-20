class Bet < ActiveRecord::Base

  validate :winning_user_valid
  validate :losing_user_valid

  after_save :update_users

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
      errors.add(:winner, "Winner can't be empty")
      return
    end

    if User.find_by(id: self.winner).nil?
      errors.add(:winner, "Winner was not found, try again")
      return
    end
  end

  def losing_user_valid
    if self.loser.nil?
      errors.add(:loser, "Loser can't be empty")
      return
    end

    if User.find_by(id: self.loser).nil?
      errors.add(:loser, "Loser was not found, try again")
      return
    end
  end

end
