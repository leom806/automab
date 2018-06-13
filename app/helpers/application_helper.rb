module ApplicationHelper

  
  def show_sweet
    modal = %Q{
      <script> 
        sweetAlert({
          title: "#{notice}",
          text: "",
          confirmButtonText: "Ok!",
          showCancelButton: false,
          closeOnConfirm: true
        }); 
      </script>
    }
    flash.clear
    modal
  end

  
  def flash?
    !flash.blank?
  end


  def is_active?(path)

    return "active" if controller.controller_name == 'main' && path == '/'

    if path.include? controller.controller_name 
      "active"     
    end
  end
end
