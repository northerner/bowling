require_relative '../player.rb'

describe Player do
  it 'returns a score based on total frame scores' do
    test_player = Player.new
    test_player.stub(:frames => [stub(:score => 5), stub(:score => 10)])
    test_player.score.should == 15
  end
end
