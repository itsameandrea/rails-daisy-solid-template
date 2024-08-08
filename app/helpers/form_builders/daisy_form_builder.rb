class FormBuilders::DaisyFormBuilder < ActionView::Helpers::FormBuilder
  def daisy_text_field(field_name, attributes = {}, &)
    label = options.delete(:label) { field_name.to_s.humanize }
    type = options.delete(:type) { :text }

    @template.render Ui::Inputs::Text::Component.new(field_name, form_builder: self, type: type, label: label, **attributes, &)
  end

  def daisy_email_field(field_name, attributes = {}, &)
    label = options.delete(:label) { field_name.to_s.humanize }
    type = options.delete(:type) { :email }
    @template.render Ui::Inputs::Text::Component.new(field_name, form_builder: self, type: type, label: label, autocomplete: "email", **attributes, &)
  end

  def daisy_password_field(field_name, attributes = {}, &)
    label = options.delete(:label) { field_name.to_s.humanize }
    type = options.delete(:type) { :password }
    @template.render(Ui::Inputs::Text::Component.new(field_name, form_builder: self, label: label, type: type, **attributes), &)
  end

  def daisy_text_area(field_name, attributes = {}, &)
    label = options.delete(:label) { field_name.to_s.humanize }
    @template.render(Ui::Inputs::Textarea::Component.new(field_name, form_builder: self, label: label, **attributes), &)
  end

  def daisy_select(field_name, options_for_select, options = {}, html_options = {}, &block)
    label = options.delete(:label) { field_name.to_s.humanize }
    @template.render(Ui::Inputs::Select::Component.new(field_name, options: options_for_select, form_builder: self, label: label, **options, **html_options), &block)
  end

  def daisy_submit(value = nil, attributes = {})
    value ||= submit_default_value
    options.delete(:type)
    @template.render Ui::Button::Component.new(value, kind: :primary, type: :submit, **attributes)
  end

  def daisy_file_field(field_name, attributes = {})
    label = attributes.delete(:label) { field_name.to_s.humanize }
    accept = attributes.delete(:accept) { "text/csv" }

    @template.render Ui::Inputs::File::Component.new(
      field_name,
      form_builder: self,
      label: label,
      accept: accept,
      **attributes
    )
  end

  def daisy_label(field_name, attributes = {}, &block)
    label_text = attributes.delete(:text) { field_name.to_s.humanize }
    @template.render(Ui::Inputs::Label::Component.new(field_name, form_builder: self, text: label_text, **attributes), &block)
  end
end
