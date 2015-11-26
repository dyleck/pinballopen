class CreatePhasesUsers < ActiveRecord::Migration
  def change
    create_table :phases_users do |t|
      t.references :phase, index: true
      t.references :user, index: true
    end
  end
end
