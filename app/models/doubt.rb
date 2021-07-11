class Doubt < ApplicationRecord
    has_many :doubts, dependent: :destroy
    enum status: [:Reviewed, :Submitted]
end
