class Category < ApplicationRecord
    paginates_per 10
    validates :pt_name, presence: true, uniqueness: true
    has_many :post_categories, dependent: :destroy
    has_many :posts, through: :post_categories
end
