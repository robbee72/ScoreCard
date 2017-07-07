class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.text :status
      t.integer :ranking

      t.timestamps
    end
  end
end
