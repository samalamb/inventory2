class AddTopicToItems < ActiveRecord::Migration
  def change
    add_column :items, :topic_id, :integer
    add_index :items, :topic_id
  end
end
