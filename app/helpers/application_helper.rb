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

end
