require_relative '../frame.rb'

describe Frame do
  it 'is initialized with a score of 0' do
    test_frame = Frame.new
    test_frame.score.should == 0
  end
  it 'gives a score of 8 after a new rolls of 2 and 6' do
    test_frame = Frame.new
    test_frame.new_roll 2
    test_frame.new_roll 6
    test_frame.score.should == 8
  end
  it 'gives a score of 3 after a roll of 3' do
    test_frame = Frame.new
    test_frame.new_roll 3
    test_frame.score.should == 3
  end
  it 'gives a score of 4 after new rolls of 0 and 4' do
    test_frame = Frame.new
    test_frame.new_roll 0
    test_frame.new_roll 4
    test_frame.score.should == 4
  end
  it 'returns next after a second roll' do
    test_frame = Frame.new
    test_frame.new_roll 2
    test_frame.new_roll(6).should == :next
  end

end

