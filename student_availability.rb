require 'csv'

module RmuEntranceExam
  TEST_FILE_NAME = 'student_availability.csv'
  class StudentAvailability
    def initialize
      @name = ''
      @monday_times = []
      @wednesday_times = []
    end
    def StudentAvailability.from_csv_row(csv_row)
      student_availability = StudentAvailability.new
      student_availability.name = row[0]
    end
    def StudentAvailability.load_csv_file(csv_file=RmuEntranceExam::TEST_FILE_NAME)
      loaded_file = CSV.read(csv_file)
      loaded_file[1..-1].map {|row| StudentAvailability.from_csv_row(row)}
    end
    def StudentAvailability.times_from_availability_column(availability_column)
      'Times not parsed yet'
    end
 end
end
