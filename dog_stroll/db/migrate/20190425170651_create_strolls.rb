class CreateStrolls < ActiveRecord::Migration[5.2]
  def change
    create_table :strolls do |t|
      t.belongs_to :dogsitter, foreign_key: true
      t.timestamps
    end
  end
end
