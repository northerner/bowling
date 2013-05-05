require_relative '../frame.rb'

describe Frame do
  before(:each) do
    @test_frame = Frame.new
  end

  it 'is initialized with a score of 0' do
    @test_frame.score.should == 0
  end
  it 'gives a score of 8 after new rolls of 2 and 6' do
    @test_frame.new_roll 2
    @test_frame.new_roll 6
    @test_frame.score.should == 8
  end
  it 'gives a score of 3 after a roll of 3' do
    @test_frame.new_roll 3
    @test_frame.score.should == 3
  end
  it 'gives a score of 4 after new rolls of 0 and 4' do
    @test_frame.new_roll 0
    @test_frame.new_roll 4
    @test_frame.score.should == 4
  end
  it 'returns next after a second roll' do
    @test_frame.new_roll 2
    @test_frame.new_roll(6).should == :next
  end
  it 'returns next after a first roll of 10 - a strike' do
    @test_frame.new_roll(10).should == :next
  end
  it 'does not return next after a first roll of 9' do
    @test_frame.new_roll(9).should_not == :next
  end
  it 'sets strike_or_spare to strike after a first score of 10' do
    @test_frame.new_roll(10)
    @test_frame.strike_or_spare.should == :strike
  end
  it 'sets strike_or_spare to spare after a roll of 4 and roll of 6' do
    @test_frame.new_roll(4)
    @test_frame.new_roll(6)
    @test_frame.strike_or_spare.should == :spare
  end
  it 'sets strike_or_spare to spare after a roll of 0 and roll of 10' do
    @test_frame.new_roll(0)
    @test_frame.new_roll(10)
    @test_frame.strike_or_spare.should == :spare
  end

end

