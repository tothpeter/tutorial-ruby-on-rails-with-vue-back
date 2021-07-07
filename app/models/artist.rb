class Artist < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy

  validates_presence_of :name
end
