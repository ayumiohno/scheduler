class CreateBelongs < ActiveRecord::Migration[6.1]
  def change
    create_table :belongs do |t|
			t.integer :group_id
			t.integer :user_id
      t.timestamps
    end

		add_index :belongs, :group_id
		add_index :belongs, :user_id
		add_index :belongs, [:group_id, :user_id], unique: true

  end
end
