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
	
	def collection_select_with_title_and_class(form_for, attribute, collection,id,name, padre, nombrepadre)
		result="<select name=\"#{form_for}[#{attribute.to_s}]\"  id=\"#{form_for}_#{attribute.to_s}\" class=\"selectable\">"
		var=id.to_s
		collection.each do |o|
		result+="<option class=\"#{o.send(padre).send(nombrepadre).downcase}\" title=\"#{o.send(name).downcase}\" value=\"#{o.send(id)}\">#{o.send(name)}</option>"
		end
		result+='</select>'
		result
	end
	
	def collection_select_with_title(form_for, attribute, collection,id,name)
		result="<select name=\"#{form_for}[#{attribute.to_s}]\"  id=\"#{form_for}_#{attribute.to_s}\" class=\"selectable\">"
		var=id.to_s
		collection.each do |o|
		result+="<option title=\"#{o.send(name).downcase}\" value=\"#{o.send(id)}\">#{o.send(name)}</option>"
		end
		result+='</select>'
		result
	end
	
end