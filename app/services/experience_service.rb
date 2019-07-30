class ExperienceService

  def recommend(exp)
    @res_locations = Experience.where(["location_id = ?", exp.location_id]).first(4)
    # @categories = CategoryExperience.where(["experience_id = ?", exp.id]).first(4)
    # @categories.each do |cat|
    #   @res_categories = (Experience.find(cat.experience_id))
    # end 

    return @res_locations
    # if @res_categories.nil?
      
    # else
    #   return @res_categories
    # end 
  end

  def latest
    @experience = Experience.all.order(created_at: :DESC).first
  end 

  def hottest
    @experiences = Experience.all.order(created_at: :DESC).first(8)
  end 

  def hotexperience(location)
    @hot_exp = Experience.where(["location_id = ?", location]).first(2)
  end 

  def available_from(date)    
    exp_froms = []
    date.each_with_index do |obj, i|
      exp_froms << obj.expFrom.to_date.month
      exp_froms << obj.expFrom.to_date.day      
    end 
    return exp_froms
  end 
  
  def available_to(date)    
    exp_tos = []
    date.each_with_index do |obj, i|
      exp_tos << obj.expTo.to_date.month
      exp_tos << obj.expTo.to_date.day
    end 
    return exp_tos
  end
end 