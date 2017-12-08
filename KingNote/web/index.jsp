<%@ page contentType="text/html" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" scope="request" value="Notas - KingNote"/>
<jsp:include page="includes/header.jsp"  />
<script>
    $(document).ready(function () {
    //<!-- begin - hide/show search and filter -->
    <c:if test="${param.search != ''}">
        $('#searchBox').show();
        $('#showSearch').hide();
        $('#inputSearch').val('${param.search}');
    </c:if>
    <c:if test="${param.search == '' || param.search == null}">
        $('#searchBox').hide();
        $('#showSearch').show();
    </c:if>

    <c:if test="${param.filter != ''}">
        $('#filterBox').show();
        $('#showFilter').hide();
        $('#inputFilter').val('${param.filter}');
    </c:if>
    <c:if test="${param.filter == ''  || param.filter == null}">
        $('#filterBox').hide();
        $('#showFilter').show();
    </c:if>
    $('#showSearch').click(function () {
        $('#searchBox').show();
        $('#showSearch').hide();
    });
    $('#showFilter').click(function () {
        $('#filterBox').show();
        $('#showFilter').hide();
    });
    //<!-- end - hide/show search and filter -->
    
    //<!-- begin - validation form -->
    $("form").submit(function (e) {
        if ($("form").find("#title").val() == "") {
            iaoMessage('Informe o título da nota', 'error');
            return false;
        }
    });
    //<!-- end - validation form -->
    });
</script>

<!-- begin - content page index -->
<div class="container">
    <button type="button" id="showSearch"class="btn btn-success btn-md">Buscar</button>
    <button type="button" id="showFilter"class="btn btn-success btn-md">Filtar</button>
    <div class="row">
        <div class="col-xs-6" id="searchBox">
            <div class="page-header">
                <h1>Buscar <a onclick="cleanSearchFilter('buscar')"><small>limpar</small></a></h1>
            </div>
            <div class="input-group">
                <input type="text" id="inputSearch" class="form-control" placeholder="digite um título">
                <span class="input-group-btn">
                    <a onclick="goToSearchFilter('buscar')" class="btn btn-info" role="button">Buscar</a>
                </span>
            </div>
        </div>

        <div class="col-xs-6" id="filterBox">
            <div class="page-header">
                <h1>Filtro <a onclick="cleanSearchFilter('filtrar')"><small>limpar</small></a></h1>
            </div>
            <div class="input-group">
                <select id="inputFilter" class="form-control selectpicker">
                    <option value="">Selecione uma categoria</option>
                    <c:if test="${sessionScope.kingnote.getAllCategories() != null}">
                        <c:forEach items="${sessionScope.kingnote.getAllCategories()}" var="category" >
                            <option style="background: ${category.getColor()}; color: #fff;" value="${category.getId()}">${category.getName()}</option>
                        </c:forEach>
                    </c:if>
                </select>
                <span class="input-group-btn">
                    <a onclick="goToSearchFilter('filtrar')" class="btn btn-info" role="button">Filtrar</a>
                </span>
            </div>
        </div>
    </div>

    <!-- begin - page title -->
    <div class="page-header">
        <h1>Notas</h1>
    </div>
    <!-- end - page title -->

    <!-- begin - row - notes -->
    <div class="row">
        <!-- begin - new note -->
        <div class="col-md-3" id="notepad">
            <form action="KingNoteServlet" method="POST">
                <input type="hidden" name="operacao" value="cadNote"/>
                <div class="row" id="top">
                    <input type="text" 
                           name="title" 
                           id="title" 
                           autocomplete="off" 
                           onfocus="$(this).css('backgroundPosition', '0 -29px')" 
                           onblur="$(this).css('backgroundPosition', '0 0')" 
                           style="background-position: 0px 0px;">
                    <div id="note-buttons">
                        <button type="submit" class="button-no-style">
                            <span class="glyphicon glyphicon-floppy-disk"></span> 
                        </button>
                    </div>
                </div>
                <div class="row" id="body-container">
                    <div class="col-md-12">
                        <textarea id="body" name="text" style="height: 250px;"></textarea>
                    </div>
                </div>
            </form>
        </div>
        <!-- end - new note -->

        <!-- begin - list notes -->
        <c:if test="${sessionScope.kingnote.getNotes(param.search, param.filter) != null}">
            <c:forEach items="${sessionScope.kingnote.getNotes(param.search, param.filter)}" var="note">
                <div class="col-md-3" id="notepad">
                    <form action="KingNoteServlet" method="POST">
                        <input type="hidden" name="operacao" value="editNote"/>
                        <input type="hidden" name="idNote" value="${note.getId()}"/>
                        <div class="row" id="toptags">
                            <c:if test="${note.getCategories() != null}">
                                <c:forEach items="${note.getCategories()}" var="category">
                                    <span class="label" style="background-color: ${category.getColor()}">${category.getName()}</span>
                                </c:forEach>
                            </c:if>       
                        </div>
                        <div class="row" id="top">
                            <input type="text" 
                                   name="title" 
                                   id="title" 
                                   autocomplete="off" 
                                   value="${note.getTitle()}" 
                                   onfocus="$(this).css('backgroundPosition', '0 -29px')" 
                                   onblur="$(this).css('backgroundPosition', '0 0')" 
                                   style="background-position: 0px 0px;" >
                            <div id="note-buttons">
                                <button type="submit" class="button-no-style">
                                    <span class="glyphicon glyphicon-floppy-disk"></span> 
                                </button>
                                <a href="addReminder.jsp?id=${note.getId()}" title="Definir lembretes"> <span class="glyphicon glyphicon-time" style="color: #08c;"></span> </a>
                                <a href="addCategory.jsp?id=${note.getId()}" title="Definir categorias"> <span class="glyphicon glyphicon-tags" style="color: orange;"></span> </a>
                                <a onclick="confirmDialogGoTo('Tem certeza que deseja excluir esta nota?', '', 'KingNoteServlet?operacao=delNote&idNote=${note.getId()}')"  title="Excluir"> <span class="glyphicon glyphicon-trash" style="color: red;"></span> </a>
                            </div>
                        </div>
                        <div class="row" id="body-container">
                            <div class="col-md-12">
                                <textarea id="body" name="text" style="height: 250px;">${note.getText()}</textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </c:forEach>
        </c:if>
        <!-- end - list notes -->
    </div>
    <!-- end - row - notes -->
</div>
<jsp:include page="includes/footer.jsp"  />