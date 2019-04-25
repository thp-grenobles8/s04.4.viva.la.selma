class CreateJoinStrollDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :join_stroll_dogs do |t|
      t.belongs_to :stroll, foreign_key: true
      t.belongs_to :dog, foreign_key: true
      t.timestamps
    end
  end
end
