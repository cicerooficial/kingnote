<%@ page contentType="text/html" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" scope="request" value="Categoria - KingNote"/>
<jsp:include page="includes/header.jsp"  />

        <!-- INICIO CONTEUDO -->
        <div class="container">
            <div class="page-header">
                <h1>C</h1>
            </div>
            <form class="form-horizontal" action="" method="POST">

                <input type="hidden" name="notaId" value="${param.id}"/>

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

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-success btn-md">
                            <span class="glyphicon glyphicon-floppy-disk"></span>
                            Salvar
                        </button>
                    </div>
                </div>
            </form>

            <div class="row">
                <div class="col-md-2"></div>

                <div class="col-md-8" >

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="col-md-1">#</th>
                                <th>Nome</th>
                                <th class="col-md-3">Cor</th>
                                <th class="col-md-1">Ação</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr >
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td style="background-color: tan;"></td>
                                <td class="text-center">
                                    <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span> </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>

                <div class="col-md-2"></div>
            </div>

        </div>


    <jsp:include page="includes/footer.jsp"  />