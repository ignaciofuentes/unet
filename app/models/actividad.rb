class Actividad < ActiveRecord::Base
  belongs_to :grupo_estudiantil
  has_many :comentarios, :as =>:comentable
end