require 'csv'
require 'date'

module RmuEntranceExam
  TEST_FILE_NAME = 'student_availability.csv'
  class StudentAvailability
    attr_accessor :name, :monday_times, :wednesday_times
    @@debug_print = false
    def initialize
      @name = ''
      @monday_times = []
      @wednesday_times = []
    end
    def StudentAvailability.from_csv_row(csv_row)
      student_availability = StudentAvailability.new
      student_availability.name = csv_row[0]
      puts student_availability.name if @@debug_print
      puts 'monday' if @@debug_print
      student_availability.monday_times =
        StudentAvailability.times_from_availability_column(csv_row[1])
      puts 'wednesday' if @@debug_print
      student_availability.wednesday_times =
        StudentAvailability.times_from_availability_column(csv_row[2])
      student_availability
    end
    def StudentAvailability.load_csv_file(csv_file=RmuEntranceExam::TEST_FILE_NAME)
      loaded_file = CSV.read(csv_file)
      loaded_file[1..-1].map {|row| StudentAvailability.from_csv_row(row)}
    end
    def StudentAvailability.times_from_availability_column(availability_column)
      time_array = availability_column.split(',').collect {|aTime| aTime.strip}
      puts time_array if @@debug_print
      time_array
    end
 end
end
