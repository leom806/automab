
dragMoveListener = (event) ->
  target = event.target
  x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx
  y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy

  target.style.webkitTransform = 'translate(' + x + 'px, ' + y + 'px)'
  target.style.transform = 'translate(' + x + 'px, ' + y + 'px)'

  target.setAttribute('data-x', x)
  target.setAttribute('data-y', y)


window.dragMoveListener = dragMoveListener

jQuery ->

  interact '#drag'
    .draggable
      onmove: dragMoveListener
    #.on 'resizemove', (event) -> 
      #target = event.target
      #x = (parseFloat(target.getAttribute('data-x')) || 0)
      #y = (parseFloat(target.getAttribute('data-y')) || 0)
      #target.style.width  = event.rect.width + 'px'
      #target.style.height = event.rect.height + 'px'   
      #x += event.deltaRect.left
      #y += event.deltaRect.top
      #target.style.webkitTransform = target.style.transform = 'translate(' + x + 'px,' + y + 'px)'
      #target.setAttribute('data-x', x)
      #target.setAttribute('data-y', y)
        

  interact '.lista-direita'
    .resizable
      edges: { 
        left: true
      },
      inertia: true,
      restrictEdges: {
        outer: 'parent',
        endOnly: true
      }       
    .on 'resizemove', (event) ->
      target = event.target
      x = (parseFloat(target.getAttribute('data-x')) || 0)
      target.style.width  = event.rect.width + 'px'
      
  $('.table').dataTable
    pagingType: "full",
    pageLength: 25,
    language: { 
      search: "Pesquisar",
      lengthMenu: "_MENU_",
      paginate: {
        first: "",
        last: "",
        next: "",
        previous: ""
      },
      info: "Mostrando _START_ até _END_ de _TOTAL_ registros.",
      infoEmpty: "Nenhum registro."
    }  

#$(document).ready(ready)
#$(document).on('page:load', ready)
#$(document).on('turbolinks:load', ready)