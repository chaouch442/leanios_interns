class Stagiaire < ApplicationRecord
  has_many :internships
  has_many :internships, dependent: :destroy

  validates :last_name, :first_name, :cin, :birthdate, :phone_number, presence: true
  validates :cin, uniqueness: true
  validates :phone_number, length: { is: 8 }, numericality: { only_integer: true }
  validates :status, inclusion: { in: %w[en_cours termine] }

  scope :en_cours, -> { where(status: 'en_cours') }
  scope :termine, -> { where(status: 'termine') }
end
