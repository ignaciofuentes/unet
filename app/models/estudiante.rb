class Estudiante < ActiveRecord::Base
	belongs_to :universidad
	 validates_presence_of :nombre
	 validates_presence_of :apellido
	 validates_presence_of :email
	 validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	 validates_presence_of :universidad_id, :message=> "no existe en el sistema"
	
	def universidad_nombre
		universidad.nombre if universidad
	end
	
	def universidad_nombre=(nombre)
	self.universidad=Universidad.find_by_nombre(nombre) unless nombre.blank?
	end
	
end
