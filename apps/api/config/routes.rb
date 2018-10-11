resources :passwords, only: %i[show create] do
  collection do
    post :batch
  end
end
