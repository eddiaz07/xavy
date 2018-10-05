class CreateTagsActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_activities do |t|
      t.references :activity, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
