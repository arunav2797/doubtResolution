class TaDoubt < ApplicationRecord
    enum status: [:Resolved, :Submitted, :Escalated, :Accepted]
    has_many :Doubt
    has_many :User
end
