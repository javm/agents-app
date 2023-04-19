class Call < ApplicationRecord
    belongs_to :account
    belongs_to :agent
    belongs_to :contact

    validates :call_type, presence: true
    validates :caller_phone_number, presence: true
    validates :receiver_phone_number, presence: true
    
end
