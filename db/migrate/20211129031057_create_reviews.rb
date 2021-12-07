class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end