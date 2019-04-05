class User < ActiveRecord::Base
  has_secure_password
  has_many :journal_entries
  has_many :countries, through: :journal_entries
  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email
end
