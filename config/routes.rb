Rails.application.routes.draw do
  # Since this is an API only app, all routes need to be in this namespace
  namespace :api do
    get 'events', to: 'events#index', as: :events

    # Ping route, to monitor health/uptime of the app
    get 'ping', to: 'pings#ping', as: :ping
  end
end
