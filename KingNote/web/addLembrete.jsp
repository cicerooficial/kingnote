<%@ page contentType="text/html" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Notas - KingNote</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/custom.css" rel="stylesheet">
        <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
        <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="assets/js/ie-emulation-modes-warning.js"></script>
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->
        <link href="assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    </head>

    <body>


        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                            aria-controls="navbar">
                        <span class="sr-only">Alterar navegação</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp"><img src="assets/img/logo.png" ></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Notas</a></li>
                        <li><a href="sobre.jsp">Sobre</a></li>

                    </ul>
                </div>
            </div>
        </nav>

        <!-- INICIO CONTEUDO -->
        <div class="container">
            <div class="page-header">
                <h1>L</h1>
            </div>
            <form class="form-horizontal" action="KingNoteServlet" method="POST">
                <input type="hidden" name="operacao" value="addReminder"/>
                <input type="hidden" name="idNote" value="${param.id}"/>

                <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">Título</label>
                    <div class="col-sm-6">
                        <input class="form-control" type="text" id="titulo" name="title" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="data" class="col-md-2 control-label">Data</label>
                    <div class="col-md-3">
                        <div class="input-group date form_datetime" data-date-format="dd/mm/yyyy hh:ii" data-link-field="dtp_input1">
                            <input class="form-control" size="20" id="data" type="text" value="" readonly="">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                        </div>
                        <input type="hidden" id="dtp_input1" name="date" value="1979-09-12 03:10:07"><br>
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
                                <th>Título</th>
                                <th class="col-md-3">Data</th>
                                <th class="col-md-1">Ação</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${sessionScope.kingnote.getReminders(param.id) != null}">
                                <c:forEach items="${sessionScope.kingnote.getReminders(param.id)}" var="reminder" >
                                    <tr>
                                        <td class="row">${reminder.getTitle()}</td>
                                        <td><fmt:formatDate pattern = "dd/MM/yyyy HH:mm" value = "${reminder.getData()}" /></td>
                                        <td>
                                            <a href="delReminder.jsp?idNote=${param.id}&idReminder=${reminder.getId()}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span> </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>

                        </tbody>
                    </table>

                </div>

                <div class="col-md-2"></div>
            </div>

        </div>


        <footer class="footer">
            <div class="container">
                <p class="text-center"></p>
            </div>
        </footer>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
        <script type="text/javascript" src="assets/js/locales/bootstrap-datetimepicker.pt-BR.js" charset="UTF-8"></script>
        <script type="text/javascript">
            $('.form_datetime').datetimepicker({
                language: 'pt-BR',
                format: "dd/mm/yyyy hh:ii",
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                forceParse: 0,
                showMeridian: 0
            });
        </script>

    </body>

</html>