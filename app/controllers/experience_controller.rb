class ExperienceController < ApplicationController
  include ExperienceConcern
  $booking = nil
  def index
    add_breadcrumb I18n.t("breadcrumbs.experience"), :experience_index_path, :only => %w(experience)
    # @experiences = Experience.all.order(updated_at: :DESC).page(params[:page]).per(6)
    @hot_exp = ExperienceService.new.latest

    @search = Experience.ransack(params[:q])
    @categories = CategoryService.new.call
    @locations = LocationService.new.call
    @search.sorts = 'title desc' if @search.sorts.empty?
    @experiences = @search.result(distinct: true).order(created_at: :DESC).page(params[:page]).per(6)
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

    @exp_dates = ExperienceDate.where(["experience_id = ?", @experience.id])
    gon.expfroms = ExperienceService.new.available_from(@exp_dates)
    gon.exptos = ExperienceService.new.available_to(@exp_dates)
    
    # breacrumb
    add_breadcrumb I18n.t('breadcrumbs.experiences'), :experience_index_path, :only => %w(experiences)
    add_breadcrumb @experience.title, :experience_path
  end

  def search
    if params[:q] && params[:q][:experience_dates_expFrom].present?
      params[:q][:experience_dates_expFrom_gteq_any], params[:q][:experience_dates_expTo_lteq_any] = params[:q][:experience_dates_expFrom].split("-") 
    end
    index
    render :index
  end
  
  def application_form
    call
  end

  def confirm 
    call    
  end

  def send_request
    find_exp
    @booking_temp = { :experience_id => gon.experience_id,
                :first_choice => params[:first_choice],
                :second_choice => params[:second_choice],
                :third_choice => params[:third_choice],
                :numAdults => params[:numAdults],
                :interpreter => params[:interpreter],
                :guest_firstnam => params[:guestfirstname],
                :guest_lastname => params[:guestlastname],
                :guest_title => params[:guesttitle],
                :age => params[:age],
                :nationality => params[:nationality],
                :language => params[:language],
                :phone_number => params[:phonenumber],
                :email => params[:email],
                :address => params[:address],
                :representative_firstname => params[:representativefirstname],
                :representative_lastname => params[:representativelastname],
                :representative_title => params[:representativetitle],
                :representative_email => params[:representativeemail],    
                :send_mail_only_representative => params[:send_mail_only_representative],                          
                :total => params[:total],
                :numChildren => params[:numChildren],
                :numInfants => params[:numInfants],      
                :payment_type => params[:payment_type],
                :card_num => params[:card_num],
                :card_firstname => params[:card_firstname],
                :card_lastname => params[:card_lastname],
                :card_exp_month => params[:card_exp_month],
                :card_exp_year => params[:card_exp_year],
                :security_code => params[:security_code],
                :first_starttime => params[:first_starttime],
                :second_starttime => params[:second_starttime],
                :third_starttime => params[:third_starttime],
    }
    $booking = @booking_temp
    BookingMailer.booking_confirmation(@booking_temp).deliver
  end 

  def payment
    call
  end

  def complete
    call    
    @recommends = ExperienceService.new.recommend(@experience)
    if !$booking.nil?
      $booking[:payment_type] = params['payment_type']
      $booking[:card_num] = params['card_num']
      $booking[:card_exp_month] = params['card_exp_month']
      $booking[:card_exp_year] = params['card_exp_year']
      $booking[:security_code] = params['security_code']
      $booking[:card_firstname] = params['card_firstname']
      $booking[:card_lastname] = params['card_lastname']
      byebug
      @new_booking = Booking.create($booking)
    end 
  end

  private
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
