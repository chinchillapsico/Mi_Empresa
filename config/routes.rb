Rails.application.routes.draw do
  resources :areas
  resources :companies do
      resources :employees, only: [:create, :destroy]
  end 
  #con esto quiero decir que los empleados pertenecen y al ser creados deben tener una compañía. si quisiera hacerlo separado compañia/area/emppleado ---> hago un resouse de compañia y dentro arrea y luego un resourse  de area y luego empleado.   
  root 'companies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
