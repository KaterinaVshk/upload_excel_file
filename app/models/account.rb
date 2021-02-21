class Account < ApplicationRecord
   # belongs_to :account_classifications , foreign_key: "account"
  #  belongs_to :groupings, foreign_key: 
    has_many :data
end
