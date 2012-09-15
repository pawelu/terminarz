# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  settings               :text(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#

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
