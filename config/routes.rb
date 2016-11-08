Rails.application.routes.draw do
  get 'api/events', to: 'events#index', as: :events

  # Ping route, to monitor health/uptime of the app
  get 'api/ping', to: 'pings#ping', as: :ping
end
