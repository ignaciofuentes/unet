authorization do
  role :admin do 
  has_permission_on :actividades,:grupos_estudiantiles,:mensajes,:users, :universidades,
   :to=>[:index,:new, :show, :create, :edit, :update, :destroy]  
  end
  
  role :master do
  has_permission_on :users, :to=>[:index,:new, :show, :create, :edit, :update, :destroy]
  has_permission_on :grupos_estudiantiles, :to=>[:index, :show] 
  has_permission_on :actividades, :to=>[:index,:new, :show, :create, :edit, :update, :destroy]    
  end
  
  role :guest do
    has_permission_on :actividades, :universidades, :grupos_estudiantiles, :to=>[:index, :show] 
  end
end