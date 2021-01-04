from django.http import JsonResponse

from .models import Recurso, Lista, DetalleLista, Categoria
from django.db.models import Q

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

def busquedaFiltro(request):
    busqueda = request.GET.get('valor')
    categoria_id = request.GET.get('categoria')

    if categoria_id == "0" and not busqueda :
        recursos = Recurso.objects.filter()
    elif categoria_id == "0" and busqueda:
        recursos = Recurso.objects.filter(
                Q(nombre__contains=busqueda) | Q(usuario__first_name__contains=busqueda)
            )
    elif categoria_id != "0" and not busqueda:
        categoria = Categoria.objects.get(pk=categoria_id)
        recursos = Recurso.objects.filter(categoria=categoria)
    elif categoria_id != "0" and busqueda:        
        categoria = Categoria.objects.get(pk=categoria_id)
        recursos = Recurso.objects.filter(
                Q(nombre__contains=busqueda) | Q(usuario__first_name__contains=busqueda),
                categoria=categoria
            )
    
    tabla=''

    if recursos :
        for recurso in recursos :
            tabla += ''' <div class="card"><div class="card-body">
                <h5 class="card-title">%s - %s %s</h5>
                <h6 class="card-subtitle mb-2 text-muted">%s</h6>
                <p class="card-text">%s</p>
                <audio src="../../../media/%s" controls loop></audio>
                <br>
                <div class="btn-group" role="group" aria-label="Basic example"> ''' % (recurso.nombre, recurso.usuario.first_name, recurso.usuario.last_name, recurso.categoria.nombre, recurso.descripcion, recurso.archivo)

            if recurso.usuario.id == request.user.id:
                tabla += ''' <a class="" title="Editar recurso" href="/%s/actualizar" class="card-link"><i class="material-icons">edit</i></a>
                <a class="" title="Eliminar recurso" href="/%s/delete" class="card-link"><i class="material-icons">delete</i></a> ''' % (recurso.pk, recurso.pk)
            
            tabla += '<a class="" title="Descargar recurso" href="../../../media/%s" download="%s" class="card-link"><i class="material-icons">download</i></a><p class="bar"> |</p>' % (recurso.archivo, recurso.nombre)

            listafav = Lista.objects.get(usuario_id=request.user.id, tipo=False)   
            elemento = DetalleLista.objects.filter(lista=listafav, recurso=recurso)  
            if elemento :
                tabla += '<div id="Fav_%s"><a href="" title="Quitar de favoritos" onclick="return delFav(%s)" class="card-link"><i class="material-icons">favorite</i></a></div>' % (recurso.pk, recurso.pk)
            else :
                tabla += '<div id="Fav_%s"><a href="" title="Agregar a favoritos" onclick="return addFav(%s)" class="card-link"><i class="material-icons">favorite_border</i></a></div>' % (recurso.pk, recurso.pk)

            listasl = Lista.objects.get(usuario_id=request.user.id, tipo=True)   
            elemento = DetalleLista.objects.filter(lista=listasl, recurso=recurso)
            if elemento :
                tabla += '<div id="Sl_%s"><a href="" title="Quitar de escuchar más tarde" onclick="return delSl(%s)" class="card-link" ><i class="material-icons">watch_later</i></a></div>' % (recurso.pk, recurso.pk)
            else :
                tabla += '<div id="Sl_%s"><a href="" title="Agregar a escuchar más tarde" onclick="return addSl(%s)" class="card-link"><i class="material-icons">query_builder</i></a></div>' % (recurso.pk, recurso.pk)
        
            tabla += "</div></div></div><br>"
    else :
        tabla = '<p class="display-6"">No se encontraron recursos</p>'

    response = {}
    response['respuesta'] = tabla
    return JsonResponse(response)