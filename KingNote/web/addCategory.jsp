<%@ page contentType="text/html" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" scope="request" value="Categoria - KingNote"/>
<jsp:include page="includes/header.jsp"  />
<script>
  $(document).ready(function(){

        $("#cad-nova").hide();
 
    $("#showCadNovo").click(function(){
        $("#cad-nova").show();
        $("#cad-existente").hide();
        $("#showCadNovo").hide();
    });
});
</script>
    
    
<!-- INICIO CONTEUDO -->
<div class="container">
    <div class="page-header">
        <h1>Categorias</h1>
    </div>
    <!-- begin - tabela de categorias cadastradas -->
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
                                    <a href="KingNoteServlet?operacao=delCategory&idNote=${param.id}&idCategory=${category.getId()}" class="btn btn-danger btn-xs" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span> </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>

        </div>

        <div class="col-md-2"></div>
    </div>
    <!-- end - tabela de categorias cadastradas -->
   
    <!-- begin - cadastro -->
  
    <form class="form-horizontal" action="KingNoteServlet" method="POST">
        <input type="hidden" name="operacao" value="addCategory"/>
        <input type="hidden" name="idNote" value="${param.id}"/>
        <!-- begin - cadastro existente-->
        <div id="cad-existente">
              <h3>Cadastrar <button type="button" id="showCadNovo"class="btn btn-success btn-md">Nova</button>    </h3> 
      
 <hr>
            <div class="form-group">
                <label for="catexistente" class="col-sm-2 control-label">Categorias:</label>
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
        <!-- end - cadastro existente-->
       
        
        <!-- begin - cadastro nova-->
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
        <!-- end - cadastro nova -->
        
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-success btn-md">
                    <span class="glyphicon glyphicon-floppy-disk"></span>
                    Salvar
                </button>
            </div>
        </div>
    </form>
    <!-- end - cadastro -->
</div>
<jsp:include page="includes/footer.jsp"  />