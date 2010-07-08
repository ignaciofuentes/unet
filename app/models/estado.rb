class Estado < ActiveRecord::Base
  has_many :universidades, :dependent => :destroy
end