class Account < ApplicationRecord
    has_many :users
    has_many :contacts
end
