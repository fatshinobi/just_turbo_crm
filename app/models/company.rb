class Company < ApplicationRecord
  belongs_to :user

  has_many :company_people, :inverse_of => :company
  accepts_nested_attributes_for :company_people, reject_if: :all_blank, allow_destroy: true

  has_many :opportunities

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 3 }

  broadcasts_to ->(company) { 'companies' }, inserts_by: :prepend

  mount_uploader :ava, AvaUploader
  paginates_per 10

  scope :ordered, -> { order(id: :desc) }
end
