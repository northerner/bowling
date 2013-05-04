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
end
