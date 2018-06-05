
require 'csv'

puts "Importing countries..."
CSV.foreach(Rails.root.join("country.csv"), headers: true) do |row|
  Country.create! do |country|
  	byebug
    country.id = row[3]
    country.country = row[4]
 end
end

puts "Importing colleges..."
 CSV.foreach(Rails.root.join("colleges.csv"), headers: true) do |row|
  MedicalCollege.create! do |state|
  	state.country_id = row[0]

     state.college_name = row[1]
        end
    end