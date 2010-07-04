require 'test_helper'

class EstudianteTest < ActiveSupport::TestCase

def test_full_name_without_middle_initial  
     estudiante = Estudiante.new(:nombre => "John", :apellido => "Smith")  
     assert_equal 'John Smith', estudiante.nombre_completo
   end  
   
   def test_full_name_with_middle_initial   
     estudiante = Estudiante.new(:nombre => "Paul", :inicial_segundo => "P", :apellido => "Hughes")  
     assert_equal 'Paul P. Hughes', estudiante.nombre_completo  
   end  
   
   def test_full_name_with_empty_middle_initial  
     estudiante = Estudiante.new(:nombre => "John", :inicial_segundo => "", :apellido => "Jones")  
     assert_equal 'John Jones', estudiante.nombre_completo  
   end  
 end  

end
