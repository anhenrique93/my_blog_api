class Tag < ApplicationRecord
    paginates_per 10
    validates :name, presence: true, uniqueness: true
    has_many :post_tags, dependent: :destroy
    has_many :posts, through: :post_tags
end
