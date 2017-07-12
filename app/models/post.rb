class Post < ApplicationRecord
  validates :description, presence: true
  #validate :tittle, length: {

  #}
  #validate :count, numericality: {only_integer: true},
end
