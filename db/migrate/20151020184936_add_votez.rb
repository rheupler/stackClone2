class AddVotez < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.column :question_id, :integer

      t.timestamps
    end
  end
end
