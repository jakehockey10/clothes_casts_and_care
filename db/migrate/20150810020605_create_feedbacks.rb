class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :meet_needs_answer
      t.text :suggestions
      t.text :challenges

      t.timestamps null: false
    end
  end
end
