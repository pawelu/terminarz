# encoding: utf-8

# == Schema Information
#
# Table name: tasks
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  done       :boolean         default(FALSE)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  user_id    :integer
#

class Task < ActiveRecord::Base
  attr_accessible :date, :done, :name, :task_dates, :task_dates_attributes 
 
  has_many :task_dates, :dependent => :destroy
  belongs_to :user

  accepts_nested_attributes_for :task_dates, :allow_destroy => true

  validates :name,  :presence => true
  validate :date_existence

  after_validation :unmark_for_destruction

  # reset marked_for_destroy option of dates
  # after failed date_existence validation
  def unmark_for_destruction
    if self.errors.has_key?(:base)
      task_dates.each { |t| t.reload if t.marked_for_destruction? }
    end
  end

  def date_existence
    # require minimum one date
    errors.add :base, 'Musisz podać przynajmniej 1 datę' if task_dates.all?(&:marked_for_destruction?)
  end
end
