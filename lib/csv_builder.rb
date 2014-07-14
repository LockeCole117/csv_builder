# encoding: utf-8

module CsvBuilder
  if RUBY_VERSION.to_f >= 1.9
    require 'csv'
    CSV_LIB = CSV
  else
    require 'fastercsv'
    CSV_LIB = FasterCSV
  end
end

require 'iconv'
require 'csv_builder/transliterating_filter'
require 'csv_builder/template_handler'

if defined?(ActionView::Template)
  ActionView::Template.register_template_handler 'csvbuilder', CsvBuilder::TemplateHandler
else
  require 'csv_builder/railtie'
end
