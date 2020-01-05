class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.boolean :default, null: false
      t.references :user, foreign_key: true, null: true

      t.timestamps
    end
  end
end
