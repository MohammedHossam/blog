class Tag < ApplicationRecord
    has_many :poststags
    has_many :posts , through: :poststags

    validates :name, presence: true
    # validates :name, uniqueness: true
end
