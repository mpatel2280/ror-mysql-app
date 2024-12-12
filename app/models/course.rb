class Course < ApplicationRecord
    has_many :assignments
    has_many :students, through: :assignments
end
