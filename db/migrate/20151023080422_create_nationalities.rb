class CreateNationalities < ActiveRecord::Migration
  def change
    create_table :nationalities do |t|
      t.string :name
      t.string :flag_img_path

      t.timestamps
    end
  end
end
