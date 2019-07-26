module ApplicationHelper
  
  def hide_side_bar?
    controller_name == 'experience' && whitelist.include?(action_name)
  end

  def is_multiple_process_form?
    controller_name == 'experience' && whitelist.include?(action_name)
  end

  def whitelist
    array = [
    'application_form',
    'confirm',
    'send_request',
    'payment',
    'complete']
  end

  def cur_stick_active(element, name_input)
    unless params[:q].nil?
      params[:q][name_input].include?(element) ? 'active': '' unless params[:q][name_input].nil?
    end
  end

  def active_process path
    return 'active' if path == request.path
    nil
  end

end
