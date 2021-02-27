module Ui
  class ApplicationController < ::ApplicationController
    layout 'application'

    protect_from_forgery with: :exception
  end
end
