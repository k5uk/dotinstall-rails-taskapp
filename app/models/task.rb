class Task < ActiveRecord::Base
  belongs_to :project
  validates :title, presence: true
  scope :unfinished, -> {where(done: false)} #doneがfalseのものを検索条件として保存しなさいという意味。
end
