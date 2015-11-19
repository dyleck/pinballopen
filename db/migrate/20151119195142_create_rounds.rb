class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :phase, index: true

      t.timestamps
    end
  end
end
