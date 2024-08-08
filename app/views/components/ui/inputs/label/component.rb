# frozen_string_literal: true

class Ui::Inputs::Label::Component < ApplicationViewComponent
  param :name
  option :form_builder
  option :text, optional: true
  option :required, optional: true, default: -> { false }

  def call
    form_builder.label(name, text, class: label_classes, **attributes, &content)
  end

  private

  def label_classes
    class_names("label-text", required: required)
  end
end
