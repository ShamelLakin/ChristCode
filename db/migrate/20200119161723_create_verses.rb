class CreateVerses < ActiveRecord::Migration
  def change
    create_table :verses do |t|
      t.string :title
      t.text :content
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
