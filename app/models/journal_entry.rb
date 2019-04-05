class JournalEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  validates_presence_of :country_name, :title, :content

end
