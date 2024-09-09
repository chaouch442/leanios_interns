class ToDocument < ApplicationRecord
  belongs_to :internship
  has_one_attached :file
  validates :name, presence: true
  scope :active, -> { where(archived: false) }
  scope :archived, -> { where(archived: true) }
end
