class CreateTournamentsUsers < ActiveRecord::Migration
  def change
    create_table :tournaments_users do |t|
      t.references :tournament, index: true
      t.references :user, index: true
    end
  end
end
