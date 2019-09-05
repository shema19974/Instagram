class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true, length: {maximum: 255}
  before_validation { email.downcase! }
  has_many :posts
  has_one :profile
  has_many :favorites, dependent: :destroy
end
