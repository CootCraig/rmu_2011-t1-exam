require './rmu_schedule'
describe RmuEntranceExam::RmuSchedule do
  describe "#initialize" do
    rs = RmuEntranceExam::RmuSchedule.new
    it 'has some attributes' do
      rs.should be_a_respond_to :monday_time_24_hour
      rs.should be_a_respond_to :monday_student_list
      rs.should be_a_respond_to :wednesday_time_24_hour
      rs.should be_a_respond_to :wednesday_student_list
    end
  end
  describe "#student_count" do
    rs = RmuEntranceExam::RmuSchedule.new
    it 'does student_count 0' do
      rs.student_count.should == 0
    end
    it 'does student_count 1' do
      rs.monday_student_list = ['studc']
      rs.wednesday_student_list = ['studc']
      rs.student_count.should == 1
    end
    it 'does student_count 2' do
      rs.monday_student_list = ['studc','studa']
      rs.wednesday_student_list = ['studc']
      rs.student_count.should == 2

      rs.monday_student_list = ['studc','studa']
      rs.wednesday_student_list = ['studc','studa']
      rs.student_count.should == 2

      rs.monday_student_list = ['studc','studa']
      rs.wednesday_student_list = []
      rs.student_count.should == 2

      rs.monday_student_list = []
      rs.wednesday_student_list = ['studa','studb']
      rs.student_count.should == 2
    end
  end
  describe "#weekly_student_class_count" do
    rs = RmuEntranceExam::RmuSchedule.new
    it 'does weekly_student_class_count 1' do
      rs.monday_student_list = ['studc']
      rs.wednesday_student_list = ['studc']
      rs.weekly_student_class_count.should == 2
    end
    it 'does weekly_student_class_count 2' do
      rs.monday_student_list = ['studa','studc']
      rs.wednesday_student_list = []
      rs.weekly_student_class_count.should == 2
    end
    it 'does weekly_student_class_count 3' do
      rs.monday_student_list = ['studa','studb']
      rs.wednesday_student_list = ['studa','studb','studc']
      rs.weekly_student_class_count.should == 5
    end
  end
  describe "#<=>" do
    it 'does comparison 1' do 
      rs_lower = RmuEntranceExam::RmuSchedule.new
      rs_lower.monday_time_24_hour = 1
      rs_lower.monday_student_list = ['studc']
      rs_higher = RmuEntranceExam::RmuSchedule.new
      rs_higher.wednesday_time_24_hour = 1
      rs_higher.wednesday_student_list = ['studa','studb']
      (rs_higher <=> rs_lower).should == 1
      (rs_lower <=> rs_higher).should == -1
    end
  end
  describe "array.sort" do
    rs_1 = RmuEntranceExam::RmuSchedule.new
    rs_2 = RmuEntranceExam::RmuSchedule.new
    rs_3 = RmuEntranceExam::RmuSchedule.new
    rs_4 = RmuEntranceExam::RmuSchedule.new
    
    rs_1.monday_student_list = ['studa','studb']
    rs_1.wednesday_student_list = ['studb']
    rs_2.monday_student_list = ['studa','studb']
    rs_2.wednesday_student_list = ['studa','studb']
    [rs_2,rs_1].sort.should == [rs_1,rs_2]
    [rs_1,rs_2].sort.should == [rs_1,rs_2]

    rs_3.monday_student_list = ['studa','studb','studc']
    rs_3.wednesday_student_list = ['studa','studb']
    rs_4.monday_student_list = ['studa','studb','studc']
    rs_4.wednesday_student_list = ['studa','studb','studc']
    [rs_4,rs_3,rs_2,rs_1].sort.should == [rs_1,rs_2,rs_3,rs_4]
  end
end
