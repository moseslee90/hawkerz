# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :hawker
  has_many :foods, dependent: :destroy
  accepts_nested_attributes_for :foods,
                                reject_if: ->(a) { a[:name].blank? },
                                allow_destroy: true
end
