class CreateAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :assignments do |t|
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true
      t.string :title
      t.string :description
      t.string :grade

      t.timestamps
    end
  end
end
