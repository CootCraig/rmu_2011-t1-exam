require './rmu_roster'
describe RmuEntranceExam::RmuRoster do
  before(:all) do
    @aExam = RmuEntranceExam::RmuRoster.new
  end
  describe '#initialize' do
    it 'has availability for all students' do
      @aExam.availability_for_all_students.class.should == Array
      @aExam.availability_for_all_students[0].class.should == RmuEntranceExam::StudentAvailability
      # hard coding the next 2 because the input file is not changing
      # and this spec is a regression test on the input file
      @aExam.times_when_any_student_is_available_monday.should == [7, 8, 12, 15, 16, 17, 18, 19, 20]
      @aExam.times_when_any_student_is_available_wednesday.should == [7, 8, 12, 18, 19, 20]
    end
  end
end
