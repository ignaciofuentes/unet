require 'test_helper'

class EstudianteTest < ActiveSupport::TestCase
		fixtures :estudiantes
		
		def student
		estudiantes(:nacho)	
		end
		
	test "test nombre completo sin inicial_segundo" do  
     estudiante = Estudiante.new(:nombre => "Ignacio", :apellido => "Fuentes")  
     assert_equal 'Ignacio Fuentes', estudiante.nombre_completo, "\nSin Inicial Segundo\n"
   end  
   
   test "test nombre completo con inicial segundo" do  
     estudiante = Estudiante.new(:nombre => "Some", :inicial_segundo => "R", :apellido => "Guy")  
     assert_equal 'Some R. Guy', estudiante.nombre_completo , "\nCon inicial segundo\n"
   end  
   
   test "test nombre completo con inicial_segundo vacio" do  
     estudiante = Estudiante.new(:nombre => "Ignacio", :inicial_segundo => "", :apellido => "Fuentes")  
     assert_equal 'Ignacio Fuentes', estudiante.nombre_completo, "\nInicial segundo vacio\n"
   end 
   
   test "Estudiante no deberia guardarse sin nombre" do
	nacho=student
	nacho.nombre=""
	assert !nacho.save, "\nSe guardo el estudiante sin nombre\n"
   end
   
   test "Estudiante no deberia guardarse sin apellido" do
	nacho=student
	nacho.apellido=""
	assert !nacho.save, "\nSe guardo el estudiante sin apellido\n"
   end
   
   test "Estudiante no deberia guardarse sin email" do
	nacho=student
	nacho.email=""
	assert !nacho.save, "\nSe guardo el estudiante sin email\n"
   end
   
   test "Estudiante no deberia guardarse con email invalido" do
	nacho=student
	nacho.email="asasxc"
	assert !nacho.save, "\nSe guardo el estudiante con email invalido\n"
   end
   
   test "Estudiante no deberia guardarse con inicial_segundo de mas de un caracter" do
	nacho=student
	nacho.inicial_segundo="ddd"
	assert !nacho.save, "\nSe guardo el estudiante con mas de un caracter en inicial segundo\n"
   end
   
   test "Estudiante no deberia guardarse sin universidad" do
	nacho=student
	nacho.universidad_id = ""
	assert !nacho.save, "\nSe guardo el estudiante sin universidad asociada\n"
   end
   
   

   
end
