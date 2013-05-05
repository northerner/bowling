require_relative 'frame'

class Player

  attr_accessor :current_frame
  attr_accessor :frames
  attr_reader :name
  
  def initialize(name="MrDefault")
    @name = name
    @frames = []
    10.times do
      @frames << Frame.new
    end
    @current_frame = @frames.first
  end

  def score
    @current_score = 0
    frames.each_with_index do |frame, i| 
      @current_score += frame.score
      if frame.score == 10
        case frame.strike_or_spare
          when :strike 
            @current_score += @frames[i + 1].score
          when :spare 
            @current_score += @frames[i + 1].first_roll
        end
      end
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
