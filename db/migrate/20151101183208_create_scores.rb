class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :value
      t.belongs_to :match, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
