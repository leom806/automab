module ApplicationHelper
  def show_flash
    modal = %Q{
      <script> 
        sweetAlert({
          title: "Mensagem!",
          text: "#{notice}",
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
end
