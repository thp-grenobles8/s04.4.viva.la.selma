class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :specialty
      t.string :zip_code
      # un first_name, qui est un string
      # un last_name, qui est un string
      # un specialty, qui est un string
      # un zip_code, qui est un string
      t.timestamps
    end
  end
end
