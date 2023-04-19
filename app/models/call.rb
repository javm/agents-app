class Call < ApplicationRecord
    belongs_to :account
    belongs_to :agent
    belongs_to :contact

    validates :caller_phone_number, presence: true
    validates :receiver_phone_number, presence: true
    
end
