namespace :input_data do
  desc "input data from excel into db"
  task input: :environment do
    test_excel
  end
end

def test_excel
  require 'roo'
  s = Roo::Excelx.new(File.expand_path(File.join(File.dirname(__FILE__),"dishes.xlsx")))
  sheets_count = s.sheets.count - 1
  0.upto(sheets_count) do |sheet|
    s.default_sheet = s.sheets[sheet]
    row_count = s.last_row - 1
    # create restaurant
    restaurant = Restaurant.create!(name: s.cell(1,1), phone: s.cell(s.last_row, 1))
    3.upto(row_count) do |row|
      next if s.cell(row, 1).nil?
      # create dish
      puts "#{s.cell(row, 1)} #{s.cell(row, 2).sub('元', '')} #{s.cell(row, 3)}"
      Dish.create!(
        name: s.cell(row, 1), 
        price: s.cell(row, 2).sub('元', '').to_i, 
        dish_type_id: DishType.find_or_create_by(name: s.cell(row, 3)).id,
        restaurant_id: restaurant.id
      )
    end
  end
end

