class Player < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :ranking, presence: true, length: {minimum: 1, maximum: 4}

end
