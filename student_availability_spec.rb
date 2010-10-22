require './student_availability'
describe RmuEntranceExam::StudentAvailability do
  it 'Test file exists' do
    File.exist?(RmuEntranceExam::TEST_FILE_NAME).should be_true
  end
end
