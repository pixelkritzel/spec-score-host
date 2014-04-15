Rails.application.routes.draw do
  root 'welcome#index'
  mount SpecScoreApi::Engine, at: "/api/v0" 
end
