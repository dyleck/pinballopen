class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.integer :number_of_rounds
      t.integer :matches_per_round
      t.integer :players_per_round
      t.boolean :player_fixed
      t.boolean :phase_fixed
      t.references :tournament

      t.timestamps
    end
  end
end
