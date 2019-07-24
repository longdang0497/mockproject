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
end 