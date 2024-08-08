module ApplicationHelper
  ActionView::Base.default_form_builder = FormBuilders::DaisyFormBuilder

  def component(name, *args, **kwargs, &block)
    component = name.to_s.camelize.constantize::Component
    render(component.new(*args, **kwargs), &block)
  end
end
