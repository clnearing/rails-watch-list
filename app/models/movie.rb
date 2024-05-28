class Movie < ApplicationRecord
  validates :title, presence:, uniqueness: true
  validates :overview, presence: true
  has_many :bookmarks
  before_destroy :check_for_bookmark
end

def check_for_bookmark
  status = true
  if self.bookmarks.count > 0
    # self.errors[:deletion_status] = 'Cannot delete movie with active bookmarks.'
    status = false
  else
    # self.errors[:deletion_status] = 'OK.'
  end
  status
end
