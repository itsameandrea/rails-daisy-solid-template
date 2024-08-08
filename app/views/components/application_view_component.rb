class ApplicationViewComponent < ViewComponentContrib::Base
  extend Dry::Initializer

  include ApplicationHelper
  include ViewComponentContrib::StyleVariants

  attr_accessor :allow_db_queries
  alias_method :allow_db_queries?, :allow_db_queries

  # Move default attrs to a constants so we can re-use it
  EMPTY_ATTRS = {}.freeze
  attr_accessor :attributes

  class << self
    def html_option(name, default: nil, **opts)
      if default
        opts[:type] = proc { default.merge(_1) }
      end

      # Assuming you have `extend Dry::Initializer`
      option name, default: proc { EMPTY_ATTRS }, **opts
    end
  end

  def initialize(*, **options)
    super
    defined_option_keys = self.class.dry_initializer.options.map(&:source)
    self.attributes = options.except(*defined_option_keys)
  end

  def dots(opts)
    tag.attributes(**opts)
  end

  def klass
    attributes[:class] || ""
  end

  def data
    default_data.merge(attributes[:data] || {})
  end

  def html_attributes
    attributes.except(:class, :data)
  end

  def default_data
    {}
  end
end
