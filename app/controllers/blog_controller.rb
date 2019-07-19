# frozen_string_literal: true

class BlogController < ApplicationController
  impressionist

  def index
    # breadcrumb
    add_breadcrumb 'Blog', :blog_index_path
    @blogs = Blog.all.order(created_at: :DESC).page(params[:page]).per(3)
    @blog_first = Blog.all.order(created_at: :DESC).first
   
    @popular_blogs = Blog.popular

    @search = Blog.ransack(params[:q])
    @categories = Category.all
    @locations = Location.all
    @hashtags = Hashtag.all
    @search.sorts = 'blog_details.title desc' if @search.sorts.empty?
    @blogs = @search.result(distinct: true).order(created_at: :DESC).page(params[:page]).per(3)

    @blog_count = Blog.count
    @page = params[:page].to_i

    respond_to do |format|
      format.html
      format.json { render json: @blogs }
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @popular_blogs = Blog.popular
    @hashtags = Hashtag.all

    # breacrumb
    add_breadcrumb 'Blog', :blog_index_path
    add_breadcrumb @blog.blog_detail.title, :blog_path
  end

  def search
    unless params[:q][:categories_category_name_in].nil?
      params[:q][:categories_category_name_in] = params[:q][:categories_category_name_in].split(",")
    end
    unless params[:q][:hashtags_tag_name_in].nil?
      params[:q][:hashtags_tag_name_in] = params[:q][:hashtags_tag_name_in].split(",")
    end
    unless params[:q][:location_province_in].nil?
      params[:q][:location_province_in] = params[:q][:location_province_in].split(",")
    end
    index
    render :index
  end
end
