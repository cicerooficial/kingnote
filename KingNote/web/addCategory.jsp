<%@ page contentType="text/html" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" scope="request" value="Categoria - KingNote"/>
<jsp:include page="includes/header.jsp"  />

<script>
    $(document).ready(function () {
        //<!-- begin - hide/show new registration -->
        $('#cad-nova').hide();
        $('#showCadNovo').click(function () {
            $('#cad-nova').show();
            $('#cad-existente').hide();
            $('#showCadNovo').hide();
        });
        //<!-- end - hide/show new registration -->

        //<!-- begin - validation-->
        $('form').submit(function (e) {
            var retorno = false;
            if ($('form').find('#catexistente').val() == '' && $('form').find('#cor').val() == '' && $('form').find('#nome').val() == '')
                iaoMessage('Escolha ou cadastre uma nova categoria', 'error');
            else if ($('form').find('#cor').val() == '' && $('form').find('#nome').val() != '')
                iaoMessage('Escolha uma cor para a nova categoria', 'error');
            else if ($('form').find('#cor').val() != '' && $('form').find('#nome').val() == '')
                iaoMessage('Escolha um nome para a nova categoria', 'error');
            else
                retorno = true;
            return retorno;
        });
        //<!-- end - validation-->
    });
</script>

<!-- begin - content page category-->
<div class="container">
    <div class="page-header">
        <h1>Categorias</h1>
    </div>
    <!-- begin - catogories table -->
    <div class="row">
        <div class="col-md-2"></div>

        <div class="col-md-8" >
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th class="col-md-3">Cor</th>
                        <th class="col-md-1">Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${sessionScope.kingnote.getCategories(param.id) != null}">
                        <c:forEach items="${sessionScope.kingnote.getCategories(param.id)}" var="category" >
                            <tr>
                                <td class="row">${category.getName()}</td>
                                <td style="background-color: ${category.getColor()};"></td>
                                <td class="text-center">
                                    <a onclick="confirmDialogGoTo('Tem certeza que deseja remover a categoria desta nota?', '', 'KingNoteServlet?operacao=delCategory&idNote=${param.id}&idCategory=${category.getId()}')"  class="btn btn-danger btn-xs" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span> </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
        </div>

        <div class="col-md-2"></div>
    </div>
    <!-- end - catogories table -->

    <!-- begin - all registration -->    
    <form class="form-horizontal" action="KingNoteServlet" method="POST">
        <input type="hidden" name="operacao" value="addCategory"/>
        <input type="hidden" name="idNote" value="${param.id}"/>
        <!-- begin - existing registration -->
        <div id="cad-existente">
            <h3>Cadastrar <button type="button" id="showCadNovo"class="btn btn-success btn-md">Nova</button>    </h3> 
            <hr>
            <div class="form-group">
                <label for="catexistente" class="col-sm-2 control-label">Categoria:</label>
                <div class="col-sm-6">
                    <select name="catexistente" id="catexistente" class="selectpicker">
                        <option value="">Selecione uma categoria</option>
                        <c:if test="${sessionScope.kingnote.getAllCategories() != null}">
                            <c:forEach items="${sessionScope.kingnote.getAllCategories()}" var="category" >
                                <option style="background: ${category.getColor()}; color: #fff;" value="${category.getId()}">${category.getName()}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>
            </div>
        </div>
        <!-- end - existing registration -->

        <!-- begin - new registration-->
        <div id="cad-nova">
            <h3>Nova</h3>
            <div class="form-group">
                <label for="nome" class="col-sm-2 control-label">Nome</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" id="nome" name="nome" />
                </div>
            </div>

            <div class="form-group">
                <label for="Cor" class="col-md-2 control-label">Cor</label>

                <div class="col-md-3">
                    <div id="cp2" class="input-group colorpicker-component" data-input="#cor" >
                        <input type="hidden" id="cor" name="cor" class="form-control" />
                        <input type="text" id="corUser" class="form-control" disabled />
                        <span class="input-group-addon"><i></i></span>
                    </div>
                    <script>
                        $(function () {
                            $('#cp2').colorpicker().on('changeColor', function (e) {
                                $('#corUser')[0].style.backgroundColor = e.color.toString('hex');
                            });
                        });
                    </script>
                </div>
            </div>
        </div>
        <!-- end - new registration -->

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-success btn-md">
                    <span class="glyphicon glyphicon-floppy-disk"></span>
                    Salvar
                </button>
            </div>
        </div>
    </form>
    <!-- end - all registration -->    
</div>
<!-- end - content page category-->     
<jsp:include page="includes/footer.jsp"  />