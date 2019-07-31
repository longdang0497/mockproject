require 'date'
class ExperienceController < ApplicationController
  include ExperienceConcern

  def index
    add_breadcrumb I18n.t("breadcrumbs.experience"), :experience_index_path, :only => %w(index show)
    # @experiences = Experience.all.order(updated_at: :DESC).page(params[:page]).per(6)
    @hot_exp = ExperienceService.new.latest
    @exp_search = Experience.ransack(params[:q])
    @exp_search.sorts = 'title desc' if @exp_search.sorts.empty?
    @experiences = @exp_search.result(distinct: true).order(created_at: :DESC).page(params[:page]).per(6)
    @page = params[:page].to_i
    respond_to do |format|
      format.html
      format.json { render json: @experiences }
    end
  end

  def show
    find_exp

    @recommends = ExperienceService.new.recommend(@experience)
    @host = AdminUser.find(@experience.admin_user_id)

    load_availableDates

    # breacrumb
    add_breadcrumb I18n.t('breadcrumbs.experience'), :experience_index_path, :only => %w(index show)
    add_breadcrumb @experience.title, :experience_path
  end


  def search
    # if params[:q] && params[:q][:experience_dates_expFrom].present?
    #   params[:q][:experience_dates_expFrom_gteq_all], params[:q][:experience_dates_expTo_lteq_all] = params[:q][:experience_dates_expFrom].split("-") 
    # end
    index
    render :index
  end
  
  def application_form
    call
    @dates = @experience.available_dates
  end

  def confirm 
    call    
  end

  def send_request
    find_exp
    byebug
    @booking = { :experience_id => gon.experience_id,
                :guest_title => params[:guesttitle],
                :guest_firstnam => params[:guestfirstname],
                :guest_lastname => params[:guestlastname],
                :age => params[:age],
                :language => params[:language],
                :nationality => params[:nationality],
                :phone_number => params[:phonenumber],
                :email => params[:email],
                :address => params[:address],
                :numAdults => params[:numadults],
                :numInfants => params[:numinfants],
                :numChildren => params[:numchildren],
                :total => params[:total],
                :representative_title => params[:representativetitle],
                :representative_firstname => params[:representativefirstname],
                :representative_lastname => params[:representativelastname],
                :representative_email => params[:representativeemail],
    }
    BookingMailer.booking_confirmation(@booking).deliver
  end 

  def payment
    call
  end

  def complete
    find_exp
    @recommends = ExperienceService.new.recommend(@experience)
  end

  private 
  def load_availableDates
    @exp_dates = ExperienceDate.where(["experience_id = ?", @experience.id])
    @mergeddates = ExperienceService.new.available_dates(@exp_dates)
    Gon.global.avalailabledates = @mergeddates
  end

  def call
    find_exp
    gon.price_adult = @experience.price_adult.to_f
    gon.price_children = @experience.price_children.to_f
    gon.price_infant = @experience.price_infant.to_f
  end

  def find_exp 
    @experience = find_exp_id(params[:id])
    gon.experience_id = @experience.id 
  end
end
