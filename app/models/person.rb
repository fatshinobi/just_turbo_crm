class Person < ApplicationRecord
  belongs_to :user
  mount_uploader :ava, AvaUploader

  validates :name, presence: true

  broadcasts_to ->(person) { 'people' }, inserts_by: :prepend

  paginates_per 10
  
  scope :ordered, -> { order(id: :desc) }
end
