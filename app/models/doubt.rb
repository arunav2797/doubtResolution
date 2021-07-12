class Doubt < ApplicationRecord
    enum status: [:Resolved, :Submitted, :Escalated, :Accepted]
    has_many :comments, dependent: :destroy
    has_one :TaDoubt, dependent: :destroy
    has_one :User
end
