class ApplicationViewComponent < ViewComponentContrib::Base
  extend Dry::Initializer
  include ApplicationHelper
  
  attr_accessor :allow_db_queries
  alias_method :allow_db_queries?, :allow_db_queries
end
