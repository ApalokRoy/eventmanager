class Expense < ApplicationRecord
   belongs_to :task
   validates :name, presence: true, length: { maximum: 50 }
end
