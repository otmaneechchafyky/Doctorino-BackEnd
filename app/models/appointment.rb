class Appointment < ApplicationRecord
  belongs_to :animal
  belongs_to :vet

  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true
  validates :duration, presence: true, inclusion: { in: [1, 2, 3, 4] }
end
