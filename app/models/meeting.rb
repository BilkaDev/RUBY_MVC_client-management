class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :client
  validates :start_time, presence: true, uniqueness: true


end
