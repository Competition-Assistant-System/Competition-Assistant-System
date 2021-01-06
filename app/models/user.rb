class User < ApplicationRecord
    has_one    :user_information
    belongs_to :grant
    has_many   :score_results
    has_many   :file_uploads

    has_secure_password
    validates :username, presence: true, length: {maximum:50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum:255}, format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

end
