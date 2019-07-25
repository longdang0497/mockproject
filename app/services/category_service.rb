class CategoryService
  def call
    @categories = Category.all
  end

  # def search
  #   unless params[:q][:categories_category_name_in].nil?
  #     params[:q][:categories_category_name_in] = params[:q][:categories_category_name_in].split(",")
  #     unless params[:q][:location_province_in].nil?
  #       params[:q][:location_province_in] = params[:q][:location_province_in].split(",")
  #     end
  #   end
  # end 
end 