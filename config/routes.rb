Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'proxy/input'
  get 'proxy/output'
  get '/output' => 'proxy#output'
  root 'proxy#input'
end
