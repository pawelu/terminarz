class Task < ActiveRecord::Base
  attr_accessible :date, :done, :name
end
