class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :name
      t.references :admin, index: true, foreign_key: true
      t.string :attachment

      t.timestamps null: false
    end
  end
end
