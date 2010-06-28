class Representante < ActiveRecord::Base
  belongs_to :grupo_estudiantil
  belongs_to :user
end