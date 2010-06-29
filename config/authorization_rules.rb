authorization do
  role :admin do 
  has_permission_on :actividades,:noticias, :grupos_estudiantiles,:mensajes,:users, :universidades,
   :to=>[:index,:new, :show, :create, :edit, :update, :destroy]  
  end
  
  role :master do
  has_permission_on :users, :to=>[:index,:new, :show, :create, :destroy]
  
  has_permission_on :users, :to=>[:edit, :update] do
  if_attribute :grupos_estudiantiles=> intersects_with {user.grupos_estudiantiles},:roles=>!intersects_with{user.roles}
  if_attribute :login=>is {user.login}
  end
  has_permission_on :grupos_estudiantiles, :to=>[:index, :show] 
  has_permission_on :actividades, :to=>[:index,:new, :show, :create, :edit, :update, :destroy]    
  end
  
    role :junior do
  has_permission_on :users, :to=>[:index,:new, :show]
  has_permission_on :grupos_estudiantiles, :to=>[:index, :show] 
  has_permission_on :actividades, :to=>[:index,:new, :show, :create, :edit, :update, :destroy]    
  end
  
  role :guest do
    has_permission_on :actividades, :universidades, :grupos_estudiantiles, :to=>[:index, :show] 
  end
end