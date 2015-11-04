class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :table, index: true

      t.timestamps
    end
  end
end
