***REMOVED*** This file should contain all the record creation needed to seed the database with its default values.
***REMOVED*** The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
***REMOVED***
***REMOVED*** Examples:
***REMOVED***
***REMOVED***   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
***REMOVED***   Mayor.create(name: 'Emanuel', city: cities.first)
require 'roo'
s = Roo::Excelx.new("myspreadsheet.xlsx")
s.default_sheet = s.sheets.first
s.cell(1,1)