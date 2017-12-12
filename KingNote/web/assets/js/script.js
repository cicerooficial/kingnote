function iaoMessage(msg, type, mode = 'dark') {
    $.iaoAlert({
        msg: msg,

        // 'success', 'error', 'warning', 'notification'
        type: type,

        // light or dark
        mode: mode,

        // auto hide
        autoHide: true,

        // fade animation speed
        fadeTime: "500",

        // shows close button
        closeButton: true,

        // close on click
        closeOnClick: false,

        // custom position
        position: 'top-right',

        // fade on hover
        fadeOnHover: true,

        // z-index
        zIndex: '999',

        // additional CSS class(es)
        alertClass: ''
    });
}

function confirmDialogGoTo(title = '', msg, url) {
    var confirm = false;
    $.confirm({
        theme: 'modern',
        title: title,
        content: msg,
        buttons: {
            confirm: {
                text: 'CONFIRMAR',
                action: function () {
                    window.location.href = url;
                    confirm = true;
                }
            },
            cancel: {
                text: 'CANCELAR',
                action: function () {}
            }
        }
    });
    return confirm;
}

function goToSearchFilter(tipo) {
    tipo = (tipo == 'buscar') ? "busca" : "filtro";
    var search = $('#inputSearch').val();
    var filter = $('#inputFilter').val();

    if (search == "" && filter == "") {
        iaoMessage('Insira ' + ((tipo == 'busca') ? 'a busca' : 'o filtro') + ' corretamente!', 'error');
    } else if (search != "" && filter != "") {
        document.location = '/KingNote/index.jsp?search=' + search + '&filter=' + filter;
    } else if (search != "" && filter == "") {
        if (tipo == 'busca') {
            document.location = '/KingNote/index.jsp?search=' + search;
        } else {
            iaoMessage('Insira ' + ((tipo == 'busca') ? 'a busca' : 'o filtro') + ' corretamente!', 'error');
        }

    } else if (search == "" && filter != "") {
        if (tipo == 'busca') {
            iaoMessage('Insira ' + ((tipo == 'busca') ? 'a busca' : 'o filtro') + ' corretamente!', 'error');
        } else {
            document.location = '/KingNote/index.jsp?filter=' + filter;
        }
    }
}

function clearSearchFilter(tipo) {
    tipo = (tipo == 'buscar') ? "busca" : "filtro";
    var search = $('#inputSearch');
    var filter = $('#inputFilter');

    if (search.val() == "" && filter.val() == "") {
        document.location = '/KingNote/index.jsp';
    } else {
        if (tipo == 'busca') {
            search.val('');
            if (filter.val() == '') {
                document.location = '/KingNote/index.jsp';
            } else {
                goToSearchFilter('filtrar');
            }
        } else {
            filter.val('');
            if (search.val() == '') {
                document.location = '/KingNote/index.jsp';
            } else {
                goToSearchFilter('buscar');
            }
        }
    }
}