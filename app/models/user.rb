class User < ApplicationRecord
    enum role: [:Student, :TA, :Teacher]
    has_secure_password
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
    has_many :Doubt, dependent: :destroy
    has_many :TaDoubt
end