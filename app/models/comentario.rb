class Comentario < ActiveRecord::Base
belongs_to :comentable, :polymorphic => true  

validates_presence_of :autor, :email, :texto

end
