Rails.application.routes.draw do
  get 'api/ping', to: 'pings#ping', as: :ping
end
