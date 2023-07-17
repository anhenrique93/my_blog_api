class Network < ApplicationRecord

    validates :name, presence: true
    validates :url, presence: true
    
    belongs_to :profile
end