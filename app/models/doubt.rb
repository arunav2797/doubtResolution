class Doubt < ApplicationRecord
    enum status: [:Reviewed, :Submitted, :Accepted]
    has_many :comments, dependent: :destroy
end
