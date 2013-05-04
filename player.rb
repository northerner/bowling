class Player
  def score
    @current_score = 0
    frames.each do |frame| 
      @current_score += frame.score
    end
    @current_score
  end
end
