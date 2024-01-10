if Rails.application.config.view_component.raise_on_db_queries
  ActiveSupport::Notifications.subscribe "sql.active_record" do |*args|
    event = ActiveSupport::Notifications::Event.new(*args)

    Thread.current[:last_sql_query] = event
  end

  ActiveSupport::Notifications.subscribe("render.view_component") do |*args|
    event = ActiveSupport::Notifications::Event.new(*args)
    last_sql_query = Thread.current[:last_sql_query]
    next unless last_sql_query

    if (event.time..event.end).cover?(last_sql_query.time)
      component = event.payload[:name].constantize
      next if component.allow_db_queries?

      raise <<~ERROR.squish
        `#{component.component_name}` component is not allowed to make database queries.
        Attempting to make the following query: #{last_sql_query.payload[:sql]}.
      ERROR
    end
  end
end