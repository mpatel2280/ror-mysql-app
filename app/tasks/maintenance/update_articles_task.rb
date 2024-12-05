# frozen_string_literal: true

module Maintenance
  class UpdateArticlesTask < MaintenanceTasks::Task
    def collection
     # Article.all
     Article.where('id > ?', 3)
    end

    def process(article)
      # article.update!(body: "Updated content from MaintenanceTasks! #{Time.now.utc}")
      article.update!(body: "Updated content from MaintenanceTasks! WHERE id > 3 #{Time.now.utc}")
    end

    def count
      # Optionally, define the number of rows that will be iterated over
      # This is used to track the task's progress
    end
  end
end
