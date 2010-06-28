class Comentario < ActiveRecord::Base
belongs_to :comentable, :polymorphic => true  
end
