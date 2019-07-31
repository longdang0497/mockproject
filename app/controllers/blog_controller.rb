# frozen_string_literal: true

class BlogController < ApplicationController
  before_action :set_blog, only: [:show]
  impressionist
  def index
    # breadcrumb
    load_blog_breadcrumb
    @blog_first = Blog.all.order(created_at: :DESC).first
    @page = params[:page].to_i
    @popular_blogs = Blog.popular
    load_search
    respond_to do |format|
      format.html
      format.json { render json: @blogs }
    end
  end
  
  def show
    @popular_blogs = Blog.popular
    @hashtags = Hashtag.all
    @hot_exp = ExperienceService.new.hotexperience(@blog.location_id)
    #recommend with hashtags and location in common
    @recommend_blogs = Blog.hashtags_and_location_in_common(@blog)
    # breacrumb
    load_detail_blog_breadcrumb
  end

  def search
    index
    render :index
  end

  private
  def load_blog_breadcrumb
    add_breadcrumb 'Blog', :blog_index_path
  end

  def load_detail_blog_breadcrumb
    load_blog_breadcrumb
    add_breadcrumb @blog.title, :blog_path
  end

  def load_search
    @search = Blog.ransack(params[:q])
    @search.sorts = 'created_at desc' if @search.sorts.empty?
    @blogs = @search.result(distinct: true).order(created_at: :DESC).page(params[:page]).per(3)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
