class Category < ActiveRecord::Base
  has_many :ideas

  validates :title, presence: true
end
