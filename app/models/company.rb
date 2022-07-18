class Company < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 3 }

  broadcasts_to ->(company) { 'companies' }, inserts_by: :prepend

  mount_uploader :ava, AvaUploader
  paginates_per 10

  scope :ordered, -> { order(id: :desc) }
end
