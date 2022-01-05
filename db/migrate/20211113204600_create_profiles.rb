class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :full_name
      t.string :gender
      t.string :email
      t.string :date_of_birth
      t.string :registration_no
      t.string :course
      t.string :mobile_no

      t.timestamps
    end
  end
end
