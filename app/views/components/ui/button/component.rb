# frozen_string_literal: true

class Ui::Button::Component < ApplicationViewComponent
  param :text, default: proc {}
  option :url, optional: true
  option :method, optional: true
  option :variant, default: proc { :primary }
  option :size, default: proc { :md }
  option :block, default: proc { false }
  option :type, default: proc { :button }
  option :disabled, default: proc { false }
  option :outline, default: proc { false }

  style do
    base {
      [ "btn" ]
    }
    variants {
      variant {
        primary { [ "btn-primary" ] }
        secondary { [ "btn-secondary" ] }
        accent { [ "btn-accent" ] }
        info { [ "btn-info" ] }
        success { [ "btn-success" ] }
        warning { [ "btn-warning" ] }
        error { [ "btn-error" ] }
        ghost { [ "btn-ghost" ] }
        link { [ "btn-link" ] }
        white { [ "bg-white hover:bg-gray-100" ] }
      }
      size {
        sm { [ "btn-sm" ] }
        md { [ "btn-md" ] }
        lg { [ "btn-lg" ] }
      }
      disabled {
        yes { [ "btn-disabled" ] }
      }
      block {
        yes { [ "btn-block" ] }
      }
      outline {
        yes { [ "btn-outline" ] }
      }
    }
  end

  private

  def classes
    style(variant:, disabled:, size:, outline:, block:) + klass
  end

  def content
    text.presence || super
  end

  def button_kind
    return :link if url.present? && default_method?
    return :button_to if url.present? && !default_method?

    :button
  end

  def default_method?
    method.blank? || method == :get
  end
end
