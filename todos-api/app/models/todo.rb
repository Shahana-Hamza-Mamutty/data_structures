class Todo < ApplicationRecord

  has_many :items, dependent: :destroy
  belongs_to :user, foreign_key: :created_by

  validates :title, :created_by, presence: true
end
