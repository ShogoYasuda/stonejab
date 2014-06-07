class CreateDungeons < ActiveRecord::Migration
  def change
    create_table :dungeons do |t|
      t.integer :d_id
      t.string :kind
      t.string :leader
      t.string :friend
      t.string :sub1
      t.string :sub2
      t.string :sub3
      t.string :sub4
      t.text :comment
      t.string :user_name
      t.integer :like

      t.timestamps
    end
  end
end
