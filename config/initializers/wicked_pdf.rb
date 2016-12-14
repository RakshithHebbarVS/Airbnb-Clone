# WickedPDF Global Configuration
#
# Use this to set up shared configuration options for your entire application.
# Any of the configuration options shown here can also be applied to single
# models by passing arguments to the `render :pdf` call.
#
# To learn more, check out the README:
#
# https://github.com/mileszs/wicked_pdf/blob/master/README.md

WickedPdf.config = {
  if Rails.env.production?
wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-amd64"
else
wkhtmltopdf_path = "/home/rakshith/.rvm/gems/ruby-2.2.3/bin/wkhtmltopdf"
end
WickedPdf.config = { exe_path: wkhtmltopdf_path, wkhtmltopdf: wkhtmltopdf_path}
}
