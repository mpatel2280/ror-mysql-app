class Article < ApplicationRecord
    # validates :title, absence: true
    # validates_absence_of :title, message: "title should not be set manually"
    has_rich_text :body
end
