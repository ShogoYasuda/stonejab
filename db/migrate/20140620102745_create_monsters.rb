class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :element
      t.string :sub_element
      t.string :rare
      t.integer :cost
      t.string :type
      t.string :sub_type
      t.integer :hp
      t.integer :atk
      t.integer :heal
      t.string :skill
      t.string :leader_skill
      t.string :arousal
      t.string :arousal2
      t.string :arousal3
      t.string :arousal4
      t.string :arousal5
      t.string :arousal6
      t.string :arousal7
      t.string :arousal8
      t.string :arousal9

      t.timestamps
    end
  end
end
