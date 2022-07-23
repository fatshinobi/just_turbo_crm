class Opportunity < ApplicationRecord
  belongs_to :company
  belongs_to :person
  belongs_to :user

  validates :title, presence: true
  validates :title, length: { minimum: 4 }
  validates :company, presence: true

  validate :person_must_match_to_company

  scope :ordered, -> { order(id: :desc) }

  STAGES_LIST = [:awareness, :interest, :decision, :buy]

  STATUS_LIST = [ 
    :open, :finished, :canceled
  ]

  def get_stage
    STAGES_LIST[stage]
  end

  def set_stage(stage_name)
    self.stage = STAGES_LIST.index(stage_name)
  end

  def next_stage
    self.stage += 1 if self.stage < 3
  end

  def prev_stage
    self.stage -= 1 if self.stage > 0
  end

  def is_last_stage?
    self.stage == 3
  end

  def is_first_stage?
    self.stage == 0
  end

  def get_status
    STATUS_LIST[status]
  end

  def set_status(status_name)
    self.status = STATUS_LIST.index(status_name)
  end

  def self.statuses
    STATUS_LIST
  end

  private

  def person_must_match_to_company
    return if !person

    company.company_people.each do |link|
      return if link.person == person
    end
    errors.add(:person, "Person must present the company")
  end

end
