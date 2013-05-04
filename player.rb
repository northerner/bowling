

class Player

  attr_accessor :current_frame
  def score
    @current_score = 0
    frames.each do |frame| 
      @current_score += frame.score
    end
    @current_score
  end
  
  def new_roll(score)
    @current_frame.new_roll score
  end

end
