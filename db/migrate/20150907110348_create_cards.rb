class CreateCards < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.timestamps null: false
    end
    create_table :cards do |t|
      t.belongs_to :user, index: true
      t.text :original_text
      t.text :translated_text
      t.date :review_date
      t.timestamps
    end
  end
end
