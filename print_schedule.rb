require './rmu_roster'
roster = RmuEntranceExam::RmuRoster.new
roster.build_possible_schedules_sorted
roster.print_day_roster("monday-roster.txt",
  roster.possible_schedules_sorted[-1].monday_time_24_hour,
  roster.possible_schedules_sorted[-1].monday_student_list)
roster.print_day_roster("wednesday-roster.txt",
  roster.possible_schedules_sorted[-1].wednesday_time_24_hour,
  roster.possible_schedules_sorted[-1].wednesday_student_list)
roster.possible_schedules_sorted.each do |schedule|
  puts "Monday #{schedule.monday_student_list.length}" +
    " Wednesday #{schedule.wednesday_student_list.length}" +
    " # of students #{(schedule.monday_student_list | schedule.wednesday_student_list).length}"
end
all_students = roster.possible_schedules_sorted[-1].monday_student_list |
  roster.possible_schedules_sorted[-1].wednesday_student_list
puts all_students.length
puts all_students.sort
