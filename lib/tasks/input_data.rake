namespace :input_data do
  desc "input data from excel into db"
  task input: :environment do
    test_excel
  end
end

def test_excel
  require 'roo'
    sheets = Roo::Excelx.new(File.expand_path(File.join(File.dirname(__FILE__),"dishes.xlsx")))
    sheets_count = sheets.sheets.count - 1
    0.upto(sheets_count) do |sheet|
      sheets.default_sheet = sheets.sheets[sheet]
      row_count = sheets.last_row - 1
      3.upto(row_count) do |row|
        next if sheets.cell(row, 1).nil?
        puts "***REMOVED***{sheets.cell(row, 1)} ***REMOVED***{sheets.cell(row, 2).sub('元', '')} ***REMOVED***{sheets.cell(row, 3)}"
        puts DishType.find_or_create_by(name: sheets.cell(row, 3)).id
      end
    end
end