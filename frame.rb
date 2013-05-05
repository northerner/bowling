class Frame

  attr_reader :strike_or_spare

  def score
    @first_roll.to_i + @second_roll.to_i
  end
  
  def first_roll
    @first_roll.to_i
  end

  def second_roll
    @second_roll.to_i
  end
  
  def new_roll(score)
    if score == 10 && @first_roll.nil?
      @first_roll = score
      @strike_or_spare = :strike
      :next
    elsif @first_roll.to_i + score == 10
      @second_roll = score
      @strike_or_spare = :spare
      :next
    elsif @first_roll
      @second_roll = score
      :next
    else
      @first_roll = score
    end
  end
end
