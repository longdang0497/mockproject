module BlogHelper
  def rank(index)
    case index
    when 0
      image_tag("blog/rank_icon01.png", class: "num_pic")
    when 1
      image_tag("blog/rank_icon02.png", class: "num_pic")
    when 2
      image_tag("blog/rank_icon03.png", class: "num_pic")
    end 
  end 
end
