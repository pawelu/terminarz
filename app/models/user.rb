class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  # store field for leave value
  store :settings, accessors: [:leave]
  # call method to set default value of leave after creation of new user
	after_initialize :initialize_defaults, :if => :new_record?


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :leave
  # attr_accessible :title, :body


  private
  	# set default value of leave
		def initialize_defaults
			self.leave = 0 if self.leave.nil?
		end
end
