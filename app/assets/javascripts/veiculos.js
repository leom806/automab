
function order(order_by){
  var location = window.location.href;
  window.location.href = location.substring(0, location.indexOf('?')) + '?order=' + order_by;
}

function create(){
  $('#form > input[name="_method"]').attr('value', 'post');
  $('#form').attr('action', '/veiculos');    
  $('#form').submit();  
}

function update(){
  $('#form').submit();  
}

