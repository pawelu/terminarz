# == Schema Information
#
# Table name: task_dates
#
#  id         :integer         not null, primary key
#  date       :date
#  task_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class TaskDate < ActiveRecord::Base
  attr_accessible :date, :task_id

  belongs_to :task 
end
