class User < ActiveRecord::Base
  has_many :journal_entries
  has_many :countries, through: :journal_entries 
end
