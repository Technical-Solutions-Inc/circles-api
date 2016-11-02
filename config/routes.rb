Rails.application.routes.draw do
  get 'api/ping', to: 'pings#ping'
end
