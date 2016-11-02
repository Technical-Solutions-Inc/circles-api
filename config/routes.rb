Rails.application.routes.draw do
  get '/ping', to: 'pings#ping'
end
