class CreateSignups < ActiveRecord::Migration[6.1]
  def change
    create_table :signups do |t|
      t.integer :time
      t.references :camper
      t.references :activity
      t.timestamps
    end
  end
end
