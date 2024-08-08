class ApplicationController < ActionController::Base
  append_view_path Rails.root.join("app", "views", "controllers")
  before_action :authenticate_user!
end
