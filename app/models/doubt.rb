class Doubt < ApplicationRecord
    enum status: [:Reviewed, :Submitted, :Accepted, :Escalated]
    has_many :comments, dependent: :destroy
end
