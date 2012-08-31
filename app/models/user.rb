class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  # store field for leave value
  store :settings, accessors: [:leave_all, :leave_used, :leave_days]
  # call method to set default value of leave after creation of new user
  after_initialize :initialize_defaults, :if => :new_record?


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :tasks, :dependent => :destroy

  private
    # set default value of leave
    def initialize_defaults
      self.leave_all = 0 if self.leave_all.nil?
      self.leave_used = 0 if self.leave_used.nil?
      self.leave_days = '' if self.leave_days.nil?
    end
end
