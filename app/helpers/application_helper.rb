# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def link_authorized (action,object,text, path)
		if permitted_to? action, object
			if action== :destroy
				if object.class != User
					link_to text, path, :confirm => "Esta seguro que desea Eliminar #{object.nombre}", :method =>:delete
				else
					link_to text, path, :confirm => "Esta seguro que desea Eliminar #{object.login}", :method =>:delete
				end
				
			else
			link_to text, path
			end
		end
	end
end