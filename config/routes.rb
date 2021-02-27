Ui::Engine.routes.draw do
  resource :style_guide, only: [:show], controller: 'style_guide'
end
