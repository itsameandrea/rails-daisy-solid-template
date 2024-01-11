# frozen_string_literal: true

require "test_helper"

class Hero::ComponentTest < ViewComponent::TestCase
  def test_renders
    component = build_component

    render_inline(component)

    assert_text "Hello there"
  end

  private

  def build_component(**options)
    Hero::Component.new(**options)
  end
end
