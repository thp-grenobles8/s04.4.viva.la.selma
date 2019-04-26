class CreateSpecialties < ActiveRecord::Migration[5.2]
  def change
    create_table :specialties do |t|
      t.string :label
      t.timestamps
    end

    #on enleve la colonne specialty de doctors
    remove_column :doctors, :specialty, :string

    #TEST - si je cree deux tables dans une seule migration
    #---la table de jointure
    create_table :join_table_doctor_specialties do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :specialty, index: true
      t.timestamps
    end
  end
end
