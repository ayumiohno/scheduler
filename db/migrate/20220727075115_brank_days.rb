class BrankDays < ActiveRecord::Migration[6.1]
  def change
		create_table :brankdays do |t|
			t.integer :day_id
			t.integer :time_id
			t.integer :user_id

			t.timestamps
		end

		add_index :brankdays, :day_id
		add_index :brankdays, :time_id
		add_index :brankdays, :user_id
		add_index :brankdays, [:day_id, :time_id,  :user_id], unique: true

  end
end
