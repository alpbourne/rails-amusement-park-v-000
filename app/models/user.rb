class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
    if self.nausea && self.happiness
      if self.nausea < self.happiness
        "happy"
      else self.nausea < self.happiness
        "sad"
      end
    end
  end

end
