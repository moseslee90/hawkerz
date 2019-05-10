# frozen_string_literal: true

class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name

      t.timestamps
    end
    add_reference :foods, :comment, foreign_key: true
  end
end
