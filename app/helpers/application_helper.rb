module ApplicationHelper
  def show_flash
    modal = notice
    flash.clear
    modal
  end

  def flash?
    !flash.blank?
  end
end
