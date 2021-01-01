from django.http import JsonResponse

from .models import Recurso, Lista, DetalleLista

def add_fav(request):
    recurso_id = request.GET.get('id')
    recurso = Recurso.objects.get(idRecurso=recurso_id)
    
    lista = Lista.objects.get(usuario_id=request.user.id, tipo=False)   

    elemento = DetalleLista()  
    elemento.lista = lista
    elemento.recurso = recurso
    elemento.save() 

    response = {}
    response['boton'] = '<div id="Fav_%s"><a href="" title="Quitar de favoritos" onclick="return delFav(%s)" class="card-link"><i class="material-icons">favorite</i></a></div>' % (recurso_id, recurso_id)
    return JsonResponse(response)

def add_sl(request):
    recurso_id = request.GET.get('id')
    recurso = Recurso.objects.get(idRecurso=recurso_id)
    
    lista = Lista.objects.get(usuario_id=request.user.id, tipo=True)   

    elemento = DetalleLista()  
    elemento.lista = lista
    elemento.recurso = recurso
    elemento.save() 

    response = {}
    response['boton'] = '<div id="Sl_%s"><a href="" title="Quitar de escuchar más tarde" onclick="return delSl(%s)" class="card-link"><i class="material-icons">watch_later</i></a></div>' % (recurso_id, recurso_id)
    return JsonResponse(response)

def del_fav(request):
    recurso_id = request.GET.get('id')
    recurso = Recurso.objects.get(idRecurso=recurso_id)
    
    lista = Lista.objects.get(usuario_id=request.user.id, tipo=False)   

    elemento = DetalleLista.objects.filter(lista=lista, recurso=recurso)
    elemento.delete() 

    response = {}
    response['boton'] = '<div id="Fav_%s"><a href="" title="Agregar a favoritos" onclick="return addFav(%s)" class="card-link"><i class="material-icons">favorite_border</i></a></div>' % (recurso_id, recurso_id)
    return JsonResponse(response)

def del_sl(request):
    recurso_id = request.GET.get('id')
    recurso = Recurso.objects.get(idRecurso=recurso_id)
    
    lista = Lista.objects.get(usuario_id=request.user.id, tipo=True)   

    elemento = DetalleLista.objects.filter(lista=lista, recurso=recurso)
    elemento.delete() 

    response = {}
    response['boton'] = '<div id="Sl_%s"><a href="" title="Agregar a escuchar más tarde" onclick="return addSl(%s)" class="card-link"><i class="material-icons">query_builder</i></a></div>' % (recurso_id, recurso_id)
    return JsonResponse(response)

def fav(request):
    recurso_id = request.GET.get('id')
    recurso = Recurso.objects.get(idRecurso=recurso_id)
    
    lista = Lista.objects.get(usuario_id=request.user.id, tipo=False)   

    elemento = DetalleLista.objects.filter(lista=lista, recurso=recurso)  
    if elemento :
        respuesta = '<div id="Fav_%s"><a href="" title="Quitar de favoritos" onclick="return delFav(%s)" class="card-link"><i class="material-icons">favorite</i></a></div>' % (recurso_id, recurso_id)
    else :
        respuesta = '<div id="Fav_%s"><a href="" title="Agregar a favoritos" onclick="return addFav(%s)" class="card-link"><i class="material-icons">favorite_border</i></a></div>' % (recurso_id, recurso_id)
    response = {}
    response['boton'] = respuesta
    return JsonResponse(response)

def sl(request):
    recurso_id = request.GET.get('id')
    recurso = Recurso.objects.get(idRecurso=recurso_id)
    
    lista = Lista.objects.get(usuario_id=request.user.id, tipo=True)   

    elemento = DetalleLista.objects.filter(lista=lista, recurso=recurso)  
    #respuesta = '<div id="Sl_%s"><a href="" onclick="return addSl(%s)" class="card-link">Ver más tarde</a></div>' % (recurso_id, recurso_id) 
    if elemento :
        respuesta = '<div id="Sl_%s"><a href="" title="Quitar de escuchar más tarde" onclick="return delSl(%s)" class="card-link" ><i class="material-icons">watch_later</i></a></div>' % (recurso_id, recurso_id)
    else :
        respuesta = '<div id="Sl_%s"><a href="" title="Agregar a escuchar más tarde" onclick="return addSl(%s)" class="card-link"><i class="material-icons">query_builder</i></a></div>' % (recurso_id, recurso_id)
    response = {}
    response['boton'] = respuesta
    return JsonResponse(response)

def remove(request):
    detalle_id = request.GET.get('id')
    detalle = DetalleLista.objects.get(pk=detalle_id)
    detalle.delete()

    response = {}
    response['respuesta'] = "200"
    return JsonResponse(response)

