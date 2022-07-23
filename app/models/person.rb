class Person < ApplicationRecord
  belongs_to :user
  mount_uploader :ava, AvaUploader

  has_many :company_people, :inverse_of => :person
  accepts_nested_attributes_for :company_people, reject_if: :all_blank, allow_destroy: true

  has_many :opportunities
  
  validates :name, presence: true

  broadcasts_to ->(person) { 'people' }, inserts_by: :prepend

  paginates_per 10
  
  scope :ordered, -> { order(id: :desc) }
end
