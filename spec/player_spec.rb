require_relative '../player.rb'
require_relative '../frame.rb'

describe Player do
  it 'returns a score based on total frame scores' do
    test_player = Player.new
    test_player.stub(:frames).and_return([stub(:score => 5), stub(:score => 10)])
    test_player.score.should == 15
  end
  it 'updates the frame score after each roll' do
    test_player = Player.new
    test_frame = double('frame')
    test_frame.should_receive(:new_roll).with(7)
    test_player.current_frame = test_frame
    test_player.new_roll(7)
  end
  it 'updates current_frame to point to the next frame when frame new_roll returns next symbol' do
    test_player = Player.new
    initial_frame = double('frame', :new_roll => :next)
    new_frame = double('frame')
    test_player.frames = [initial_frame, new_frame]
    test_player.current_frame = initial_frame
    test_player.new_roll(7)
    test_player.current_frame.should == new_frame
  end
  it 'returns a score of 30 after 6 new_rolls of 5' do
    test_player = Player.new
    6.times do
      test_player.new_roll(5)
    end
    test_player.score.should == 30
  end
end
