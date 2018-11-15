class AddTypeToSubscribers < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribers, :type, :string
  end
end
