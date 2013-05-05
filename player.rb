require_relative 'frame'

class Player

  attr_accessor :current_frame
  attr_accessor :frames
  
  def initialize
    @frames = []
    10.times do
      @frames << Frame.new
    end
    @current_frame = @frames.first
  end

  def score
    @current_score = 0
    frames.each do |frame| 
      @current_score += frame.score
    end
    @current_score
  end
  
  def new_roll(score)
   if (@current_frame.new_roll score) == :next
     @current_frame = next_frame 
   end
  end
  
  private
  def next_frame
    @frames[@frames.find_index(@current_frame) + 1]
  end

end
