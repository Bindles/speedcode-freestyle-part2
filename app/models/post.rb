class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: { message: "is required for registration" }
end
