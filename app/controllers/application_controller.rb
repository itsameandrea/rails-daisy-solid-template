class ApplicationController < ActionController::Base
  append_view_path Rails.root.join("app", "views", "controllers")
end
