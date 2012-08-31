class Task < ActiveRecord::Base
  attr_accessible :date, :done, :name

  validates :name, :presence => true

  belongs_to :user
end
