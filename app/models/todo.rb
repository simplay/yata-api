class Todo < ApplicationRecord
  belongs_to :user
  enum status: %i(pristine wip done canceled)

  def incomplete?
    wip? || pristine?
  end

  validates_presence_of :title
end
