class Ui::Inputs::File::Component < ApplicationViewComponent
  renders_one :top_right_label

  param :name
  option :form_builder
  option :label, optional: true
  option :error, optional: true
  option :hint, optional: true
  option :accept, optional: true
  option :wrapper_class, optional: true

  def call
    form_builder.file_field(name,
      class: "filepond",
      data: { controller: "filepond" },
      direct_upload: true,
      accept: accept,
      **attributes
    )
  end
end
