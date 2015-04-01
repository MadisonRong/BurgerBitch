namespace :input_data do
  desc "input data from excel into db"
  task input: :environment do
    test_excel
  end
end

def test_excel
  require 'roo'
    sheets = Roo::Excelx.new("/Users/MadisonRong/BurgerBitch/db/dishes.xlsx")
    sheets_count = sheets.sheets.count - 1
    0.upto(sheets_count) do |sheet|
      sheets.default_sheet = sheets.sheets[sheet]
      row_count = sheets.last_row - 1
      3.upto(row_count) do |row|
        next if sheets.cell(row, 1).nil?
        puts "#{sheets.cell(row, 1)} #{sheets.cell(row, 2).sub('元', '')} #{sheets.cell(row, 3)}"
        puts DishType.find_or_create_by(name: sheets.cell(row, 3)).id
      end
    end
end