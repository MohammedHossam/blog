class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :poststags, dependent: :destroy
    has_many :tags, through: :poststags
    belongs_to :user

    validates :title, :body, presence: true
end
