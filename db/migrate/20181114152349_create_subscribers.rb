class CreateSubscribers < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribers do |t|
    	t.string :email
      	t.timestamps
    end
  end
end
