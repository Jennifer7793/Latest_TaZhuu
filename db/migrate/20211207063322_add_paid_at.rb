class AddPaidAt < ActiveRecord::Migration[6.1]
  def change
    add_column (:orders, :datetime)
  end
end
