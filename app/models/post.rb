class Post < ApplicationRecord
    validates :pt_title, presence: true
    validates :pt_excerpt, presence: true
    validates :pt_body, presence: true
    validates :author, presence: true
    validates :date, presence: true
    validates_associated :categories
    has_many :post_categories
    has_many :categories, through: :post_categories
end
