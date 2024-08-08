# frozen_string_literal: true

class Ui::Inputs::Select::Component < ApplicationViewComponent
  renders_one :top_right_label

  param :name, optional: true
  option :options, optional: true
  option :form_builder, optional: true
  option :label, optional: true
  option :error, optional: true
  option :hint, optional: true
  option :selected, optional: true
  option :wrapper_class, optional: true
  option :include_blank, optional: true

  private

  def selected
    return super unless form_builder&.object

    form_builder.object[name] || super
  end

  def field_classes
    classes = attributes.delete(:class)
    [class_names("select select-bordered w-full bg-white", "select-error": errors), classes].compact.join(" ")
  end

  def wrapper_classes
    wrapper_class
  end

  def errors
    return error if error
    return unless form_builder&.object

    form_builder.object.errors[name]&.to_sentence&.presence
  end
end
