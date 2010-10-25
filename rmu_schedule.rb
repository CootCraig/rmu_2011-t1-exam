module RmuEntranceExam
  class RmuSchedule
    include Comparable

    attr_accessor :monday_time_24_hour
    attr_accessor :monday_student_list
    attr_accessor :wednesday_time_24_hour
    attr_accessor :wednesday_student_list
    
    def initialize
      @monday_time_24_hour = nil
      @monday_student_list = []
      @wednesday_time_24_hour = nil
      @wednesday_student_list = []
    end
    def student_count
      (monday_student_list | wednesday_student_list).length
    end
    def weekly_student_class_count
      monday_student_list.length + wednesday_student_list.length
    end
    def <=>(other)
      # First comparison is how many students are attending at least
      # one class. The maximum count will be reached when every student
      # attends at least one once.
      my_count = (monday_student_list | wednesday_student_list).length
      other_count = (other.monday_student_list | other.wednesday_student_list).length
      if my_count > other_count
        1
      elsif my_count < other_count
        -1
      else
        # Second comparison is the number of students on Monday plus
        # the number of students on Tuesday.  A student attending both
        # nights is counted twice. The maximum count will be reached
        # when every student can attend both nights.
        my_count = monday_student_list.length + wednesday_student_list.length
        other_count = other.monday_student_list.length + other.wednesday_student_list.length
        if my_count > other_count
          1
        elsif my_count < other_count
          -1
        else
          # Third comparison is on the difference of the number of
          # students attending each night. This will favor equal class
          # sizes
          my_diff = (monday_student_list.length - wednesday_student_list.length).abs
          other_diff = (other.monday_student_list.length - other.wednesday_student_list.length).abs
          if my_diff > other_diff
            1
          elsif my_diff < other_diff
            -1
          else
            0
          end
        end
      end
    end
    def score
    end
  end
end
