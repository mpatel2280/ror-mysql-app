class Assignment < ApplicationRecord
    belongs_to :student
    belongs_to :course
  
    # Additional attributes, e.g., grade
    validates :grade, presence: true
  end
  