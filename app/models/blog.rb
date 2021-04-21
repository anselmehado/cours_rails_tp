class Blog < ApplicationRecord
   validates :title, :content, presence: true
   # has_any :favorites, dependent: :destroy
   # has_many :favorite_users, through: :favprite, souce: :user
  # belong_to :user
end
