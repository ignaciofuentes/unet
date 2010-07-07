authorization do
  role :admin do 
  
  has_permission_on :actividades,:noticias, :grupos_estudiantiles,:mensajes,:users, :universidades, :estudiantes,
   :to=>[:index,:new, :show, :create, :edit, :update, :destroy]  
  end
  
  role :master do
  has_permission_on :mensajes, :to=>[:index,:new, :show, :create, :edit, :update, :destroy]
  has_permission_on :grupos_estudiantiles, :to=>[:index, :show] 
  has_permission_on :universidades, :to=>[:index, :show] 
  has_permission_on :users, :to=>[:index,:new, :show, :create]  
  has_permission_on :users, :to=>[:edit, :update, :destroy] do
  if_attribute :grupo_estudiantil=> is {user.grupo_estudiantil}, :roles=> contains {Role.find_by_name("junior")}
  if_attribute :login=>is {user.login}
  end
  has_permission_on :actividades, :to=>[:index, :show, :new, :create]
  has_permission_on :actividades, :to=>[:edit, :update, :destroy] do
  if_attribute :grupo_estudiantil=> is {user.grupo_estudiantil}
  end
  has_permission_on :noticias, :to=>[:index, :show, :new, :create]
  has_permission_on :noticias, :to=>[:edit, :update, :destroy] do
   if_attribute :grupo_estudiantil=> is {user.grupo_estudiantil}
   end 
   has_permission_on :estudiantes, :to=>[:index, :show, :new, :create]
   has_permission_on :estudiantes, :to=>[:edit, :update, :destroy] do
    if_attribute :universidad=> is {user.grupo_estudiantil.universidad}
    end   
  end
  
    role :junior do
  has_permission_on :users, :to=>[:index,:new, :show]
    has_permission_on :users, :to=>[:edit, :update] do
  if_attribute :login=>is {user.login}
  end
  has_permission_on :grupos_estudiantiles, :to=>[:index, :show] 
  has_permission_on :actividades, :to=>[:index,:new, :show, :create, :edit, :update, :destroy]    
  end
  
  role :guest do
    has_permission_on :actividades, :noticias, :universidades, :grupos_estudiantiles, :to=>[:index, :show] 
  end
end