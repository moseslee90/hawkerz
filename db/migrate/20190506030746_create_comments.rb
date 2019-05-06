class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :date
      t.float :rating
      t.text :text

      t.timestamps
    end
  end
end
