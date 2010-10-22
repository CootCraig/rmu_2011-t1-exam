require './student_availability'
module RmuEntranceExam
  class RmuRoster
    attr_reader :availability_for_all_students
    attr_reader :times_when_any_student_is_available_monday
    attr_reader :times_when_any_student_is_available_wednesday
    def initialize
      @availability_for_all_students = RmuEntranceExam::StudentAvailability.load_csv_file
      @availability_for_all_students.freeze

      @times_when_any_student_is_available_monday =
        @availability_for_all_students.inject([]) do |all,student|
        all | student.monday_times
      end
      @times_when_any_student_is_available_monday.sort!
      @times_when_any_student_is_available_monday.freeze

      @times_when_any_student_is_available_wednesday =
        @availability_for_all_students.inject([]) do |all,student|
        all | student.wednesday_times
      end
      @times_when_any_student_is_available_wednesday.sort!
      @times_when_any_student_is_available_wednesday.freeze
    end
  end
end
