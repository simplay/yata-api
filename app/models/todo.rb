class Todo < ApplicationRecord
  enum status: %i(pristine wip done canceled)

  validates_presence_of :title
end
