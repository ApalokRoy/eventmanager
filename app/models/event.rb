class Event < ApplicationRecord
  before_save { name.upcase! }
  has_many :tasks
  validates :name, presence: true, length: { maximum: 20 },  uniqueness: { case_sensitive: false }
end
