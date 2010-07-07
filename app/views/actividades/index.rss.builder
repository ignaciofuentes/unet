xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
xml.channel do
	xml.title "Actividades"
	xml.descripcion "Nuestras Actividades"
	xml.link actividades_url(:rss)
	
	for actividad in @actividades
		xml.item do
			xml.title actividad.titulo
			xml.description actividad.descripcion
			xml.pubDate actividad.fecha
			xml.link actividad_url(actividad) 
		end
	end
	
end
end