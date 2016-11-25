class Timeline < ApplicationRecord
  has_many :comments
  belongs_to :user, optional: true
  default_scope { order(created_at: :desc) }
end
