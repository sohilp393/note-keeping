# Displays the content for dafault page
module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = 'Note-Keeping'
    @seo_keywords = 'Kiprosh Note-Keeping App'
  end
end
