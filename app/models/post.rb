class Post < ActiveRecord::Base
  enum status: {submitted: 0, approved: 1, rejected: 2}
  #bypasses a lot of manual code
  validates_presence_of :date, :rationale, :overtime_request
  belongs_to :user

  validates :overtime_request, numericality: {greater_than: true}

  scope :posts_by, ->(user) {where(user_id: user.id)}
end

