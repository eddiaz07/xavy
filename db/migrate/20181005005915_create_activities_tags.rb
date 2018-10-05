class CreateActivitiesTags < ActiveRecord::Migration[5.2]
  def change
    create_table :activities_tags  do |t|
      t.references :activity, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
