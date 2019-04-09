class JournalEntry < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :country_name, :title, :content

end
