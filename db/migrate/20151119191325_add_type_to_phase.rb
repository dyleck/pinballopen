class AddTypeToPhase < ActiveRecord::Migration
  def change
    add_column :phases, :type, :string
  end
end
