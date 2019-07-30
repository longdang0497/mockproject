module ExperienceConcern
  include ActiveSupport::Concern

  def find_exp_id(expid)
    @experience = Experience.find(expid)
  end 

end