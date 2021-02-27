module Ui
  class Component < ::Cell::ViewModel
    include ActionView::Helpers::TagHelper
    include ActionView::Context
  end
end
