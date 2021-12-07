class CreateFavCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :fav_courses do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
