class Project < ActiveRecord::Base
  validates_presence_of :name
  has_many :tickets, :dependent => :delete_all
end
