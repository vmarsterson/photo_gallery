class CreateTables < ActiveRecord::Migration[5.2]
  def up
    create_table :galleries do |col|
      col.string :title
      col.string :keywords
    end

    create_table :photos do |col|
      col.string :url
      col.integer :likes
    end

    create_table :photographers do |col|
      col.string :name
      col.string :avatar
    end
  end

  def down
    remove_table :galleries
    remove_table :photos
    remove_table :photographers
  end
end
