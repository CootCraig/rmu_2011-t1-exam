require './rmu_roster'
roster = RmuEntranceExam::RmuRoster.new
roster.build_possible_schedules_sorted
puts roster.possible_schedules_sorted.length

