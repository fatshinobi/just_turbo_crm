class Person < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  broadcasts_to ->(person) { 'people' }, inserts_by: :prepend

  scope :ordered, -> { order(id: :desc) }
end
