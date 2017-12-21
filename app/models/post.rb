class Post < ActiveRecord::Base
  enum status: {submitted: 0, approved: 1, rejected: 2}
  #bypasses a lot of manual code
  validates_presence_of :date, :rationale
  belongs_to :user, optional: true
end

