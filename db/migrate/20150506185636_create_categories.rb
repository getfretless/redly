class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :title
      t.text :description
      t.text :sidebar
      t.text :submission_text
      t.timestamps
    end
  end
end
