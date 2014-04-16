Rails.application.routes.draw do
  root 'welcome#index'
  mount SpecScoreApi::Engine, at: "/api/v0" 
  mount SpecScoreRegistry::Engine, at: "/registry" 
end
