class Task < ApplicationRecord

  has_many :expenses
  belongs_to :event
  belongs_to :user
  
  validates :name, presence: true, length: { maximum:20 } 
  validates :deadline, presence: true 

  protected

end
