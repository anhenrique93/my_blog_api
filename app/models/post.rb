class Post < ApplicationRecord

    paginates_per 10

    validates :pt_title, presence: true, uniqueness: true
    validates :pt_excerpt, presence: true
    validates :pt_body, presence: true
    validates :author, presence: true
    validates :date, presence: true
    validates :categories, presence: { message: "Must have at least one category" }
    validates :tags, presence: { message: "Must have at least one tag" }

    has_many :post_categories, dependent: :destroy
    has_many :categories, through: :post_categories

    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags

    def remove_category(category)
        categories.delete(category)
    end

    def add_category(category)
        categories << category
    end

    def remove_tag(tag)
        tags.delete(tag)
    end

    def add_tag(tag)
        tags << tag
    end

end