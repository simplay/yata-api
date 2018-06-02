class Todo < ApplicationRecord
  belongs_to :user
  enum status: %i(pristine wip done canceled)

  validates_presence_of :title
end
