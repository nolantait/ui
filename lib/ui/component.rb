module Ui
  class Component < ::Cell::ViewModel
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    VIEWPATH = Pathname.new(__FILE__).join("../..")
    self.view_paths = [VIEWPATH]
  end
end
