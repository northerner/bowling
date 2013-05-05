class Frame
  def score
    @first_roll.to_i + @second_roll.to_i
  end
  
  def new_roll(score)
    if @first_roll
      @second_roll = score
      :next
    else
      @first_roll = score
    end
  end
end
