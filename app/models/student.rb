class Student < ApplicationRecord
    has_many :assignments
    has_many :courses, through: :assignments
  end
  