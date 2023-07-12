class Category < ApplicationRecord
    validates :pt_name, presence: true
    has_many :post_categories
    has_many :posts, through: :post_categories
end
