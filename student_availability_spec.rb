require './student_availability'
describe RmuEntranceExam::StudentAvailability do
  it 'Test file exists' do
    File.exist?(RmuEntranceExam::TEST_FILE_NAME).should be_true
  end
  describe '#initialize' do
    sa = RmuEntranceExam::StudentAvailability.new
    it 'Name has accessor' do
      sa.name.should == ''
      sa.name = 'Tiny Tim'
      sa.name.should == 'Tiny Tim'
    end
    it 'monday_times has accessor' do
      sa.monday_times.should == []
      sa.monday_times << '1'
      sa.monday_times.should == ['1']
    end
    it 'wednesday_times has accessor' do
      sa.wednesday_times.should == []
      sa.wednesday_times << '2'
      sa.wednesday_times.should == ['2']
    end
  end
  describe '.load_csv_file' do
    students = RmuEntranceExam::StudentAvailability.load_csv_file
    it 'returns an array' do
      students.class.should == Array
    end
    it 'has the correct number of students' do
      students.length.should == 18
    end
    it 'has read names' do
      students[0].name.should == 'Mylene Wilkinson'
      students[10].name.should == 'Americo Harber'
      students[17].name.should == 'Dannie Hilll'
    end
    it 'has read available times' do
      # [0] Monday: "8:00 am EDT (12:00 UTC), 12:00 pm EDT (16:00 UTC)"
      # [0] Wednesday: "8:00 am EDT (12:00 UTC), 12:00 pm EDT (16:00 UTC)"
      students[0].monday_times[0].should == "8:00 am EDT (12:00 UTC)"
      students[0].monday_times[1].should == "12:00 pm EDT (16:00 UTC)"
      students[0].wednesday_times[0].should == "8:00 am EDT (12:00 UTC)"
      students[0].wednesday_times[1].should == "12:00 pm EDT (16:00 UTC)"

      students[17].monday_times[2].should == "5:00 pm EDT (21:00 UTC)"
      students[17].monday_times[3].should == "6:00 pm EDT (22:00 UTC)"
      students[17].wednesday_times[1].should == "6:00 pm EDT (22:00 UTC)"
    end
  end
end
