class Contact < ApplicationRecord
    belongs_to :account
    has_many :calls
end
