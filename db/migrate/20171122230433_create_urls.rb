class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :name
      t.string :url
      t.integer :wait

      t.timestamps
    end
  end
end
