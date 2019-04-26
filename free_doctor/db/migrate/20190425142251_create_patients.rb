class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :first_name# un first_name, qui est un string
      t.string :last_name# un last_name, qui est un string
      t.timestamps
    end
  end
end
