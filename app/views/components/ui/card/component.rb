# frozen_string_literal: true

class Ui::Card::Component < ApplicationViewComponent
  option :title, default: proc { nil }
  renders_one :actions
end
