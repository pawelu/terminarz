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
 
  validates :name, :presence => true

  has_many :task_dates, :dependent => :destroy
  belongs_to :user

  accepts_nested_attributes_for :task_dates, :allow_destroy => true
end
