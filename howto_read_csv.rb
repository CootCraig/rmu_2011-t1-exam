require 'csv'
data_file = 'student_availability.csv'
row_count = 0
CSV.foreach(data_file) do |row|
  row_count += 1
 puts "#{row_count-1}) row.class=#{row.class} row.length=#{row.length}  === #{row.to_s}"
end
puts "#{row_count} rows"
=begin
student_availability.csv - 19 rows, 1 row with column names, 18 student rows
Row 1, Column names: ["Name", "Monday Availability", "Wednesday Availability"]
=end
