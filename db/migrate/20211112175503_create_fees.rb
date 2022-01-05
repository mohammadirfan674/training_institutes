class CreateFees < ActiveRecord::Migration[6.1]
  def change
    create_table :fees do |t|
      t.references :course, null: false, foreign_key: true
      t.string :name
      t.text :duration
      t.string :amount
      t.string :certificate

      t.timestamps
    end
  end
end
