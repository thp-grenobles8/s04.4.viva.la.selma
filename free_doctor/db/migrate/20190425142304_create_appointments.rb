class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :date#un date, qui est un datetime
      t.timestamps
    end
  end
end
