class AddHardnessToActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :hardness, :string
  end
end
