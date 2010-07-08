class Tema < ActiveRecord::Base
  has_many :comentarios, :as =>:comentable, :dependent => :destroy
end
