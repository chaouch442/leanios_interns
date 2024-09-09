class Internship < ApplicationRecord
  has_many :to_documents, dependent: :destroy
  belongs_to :stagiaire
  validates :start_date, :end_date, :specialty, :project, presence: true
  validate :end_date_after_start_date

  private
  def end_date_after_start_date
    if end_date.present? && start_date.present? && end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
