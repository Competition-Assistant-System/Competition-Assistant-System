class UserInformation < ApplicationRecord
    belongs_to :user

    validates :user_id, presence: true
    validates :nickname, presence: true, length: { maximum: 50 }
    validates :school, presence: true, length: { maximum: 100 }

end
