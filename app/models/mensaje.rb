class Mensaje < ActiveRecord::Base
  belongs_to :emisor, :class_name => 'User'
  belongs_to :receptor, :class_name => 'User'
  
end
