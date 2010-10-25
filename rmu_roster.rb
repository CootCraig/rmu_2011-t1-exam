require './student_availability'
require './rmu_schedule'
module RmuEntranceExam
  class RmuRoster
    attr_accessor :possible_schedules_sorted
    attr_reader :availability_for_all_students
    attr_reader :times_when_any_student_is_available_monday
    attr_reader :times_when_any_student_is_available_wednesday
    def initialize
      @possible_schedules_sorted = []
      
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
    def build_possible_schedules_sorted
      @possible_schedules_sorted = []
      times_when_any_student_is_available_monday.each do |monday_time|
        times_when_any_student_is_available_wednesday.each do |wednesday_time|
          rs = RmuEntranceExam::RmuSchedule.new
          rs.monday_time_24_hour = monday_time
          rs.wednesday_time_24_hour = wednesday_time
          availability_for_all_students.each do |student|
            rs.monday_student_list << student.name if student.monday_times.index monday_time
            rs.wednesday_student_list << student.name if student.wednesday_times.index wednesday_time
          end
          @possible_schedules_sorted << rs
        end
      end
      @possible_schedules_sorted.sort!
    end
    def print_day_roster(filename,hour_edt,student_list)
      File.open(filename,"w") do |file|
        file.puts "#{hour_edt} EDT"
        student_list.sort.each {|name| file.puts "#{name}"}
      end
    end
  end
end
