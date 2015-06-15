class Idea < ActiveRecord::Base
  belongs_to :category

  validates :description, :category_id, presence: true
end
