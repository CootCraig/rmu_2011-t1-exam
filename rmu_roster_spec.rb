require './rmu_roster'
describe RmuEntranceExam::RmuRoster do
  before(:all) do
    @aExam = RmuEntranceExam::RmuRoster.new
  end
  describe '#initialize' do
    it 'Has empty array possible_schedules_sorted' do
      @aExam.possible_schedules_sorted.class.should == Array
      @aExam.possible_schedules_sorted.length.should == 0
    end
    it 'has availability for all students' do
      @aExam.availability_for_all_students.class.should == Array
      @aExam.availability_for_all_students[0].class.should == RmuEntranceExam::StudentAvailability
      # hard coding the next 2 because the input file is not changing
      # and this spec is a regression test on the input file
      @aExam.times_when_any_student_is_available_monday.length.should == 9
      @aExam.times_when_any_student_is_available_wednesday.length.should == 6
    end
  end
end
