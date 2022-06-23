class User < ApplicationRecord
    before_save {self.annotatorID = self.annotatorID.downcase}
    validates :name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :annotatorID, presence: true, length: {maximum: 255}, uniqueness: true
    # format: {with: VALID_EMAIL_REGEX}
    has_secure_password
    validates :password, presence: true
end
