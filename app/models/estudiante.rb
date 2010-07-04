class Estudiante < ActiveRecord::Base
	belongs_to :universidad
	 validates_presence_of :nombre
	 validates_presence_of :apellido
	 validates_presence_of :email
	 validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	 validates_presence_of :universidad_id, :message=> "no existe en el sistema"
	 validates_length_of :inicial_segundo, :maximum => 1 
	
	def universidad_nombre
		universidad.nombre if universidad
	end
	
	def universidad_nombre=(nombre)
		self.universidad=Universidad.find_by_nombre(nombre) unless nombre.blank?
	end
	
	def nombre_completo
		[nombre, inicial_segundo_con_punto, apellido].compact.join(' ')
	end
	
	def inicial_segundo_con_punto
		"#{inicial_segundo}. " unless inicial_segundo.blank?
	end
	
end
