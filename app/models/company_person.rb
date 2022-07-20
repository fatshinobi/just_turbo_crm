class CompanyPerson < ApplicationRecord
  belongs_to :company
  belongs_to :person

  validates :company, presence: true
  validates :person, presence: true

end
