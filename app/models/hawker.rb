# frozen_string_literal: true

class Hawker < ApplicationRecord
  has_many :images
  has_many :comments
end
