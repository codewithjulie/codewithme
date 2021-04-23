class MicroBlog < ApplicationRecord

  validates :title, :content, presence: true, uniqueness: {case_sensitive: false}

  def previous
    # look for the previous micro_blog by id
    current_id = self.id

    # find collection of ids that come before current id
    MicroBlog.where(id: 0...current_id).last
  end

  def next
    current_id = self.id
    MicroBlog.where(id: current_id + 1..).first
  end
end
