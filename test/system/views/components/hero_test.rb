# frozen_string_literal: true

require "application_system_test_case"

class Hero::ComponentSystemTest < ApplicationSystemTestCase
  def test_default_preview
    visit("/rails/view_components/hero/default")

    assert_text "Hello therf"
  end
end
