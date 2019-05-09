# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.text :image_url
      t.belongs_to :hawker, index: true
    end
  end
end
