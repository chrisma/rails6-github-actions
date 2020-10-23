class Article < ApplicationRecord
  # https://guides.rubyonrails.org/getting_started.html#associating-models
  has_many :comments
  # https://guides.rubyonrails.org/getting_started.html#adding-some-validation
  validates :title, presence: true,
            length: { minimum: 5 }
end