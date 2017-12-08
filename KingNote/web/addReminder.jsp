<%@ page contentType="text/html" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" scope="request" value="Lembrete - KingNote"/>
<jsp:include page="includes/header.jsp"  />
<script>
    //<!-- begin - validation-->
    $(document).ready(function () {
        $('form').submit(function (e) {
            var retorno = false;
            if ($('form').find('#titulo').val() == '' && $('form').find('#dtp_input1').val() == '')
                iaoMessage('Preencha os dados corretamente!', 'error');
            else if ($('form').find('#dtp_input1').val() == '')
                iaoMessage('Escolha uma data para o novo lembrete', 'error');
            else
                retorno = true;
            return retorno;
        });
    });
    //<!-- end - validation-->
</script>
<!-- begin - content page reminder -->
<div class="container">
    <div class="page-header">
        <h1>Lembretes</h1>
    </div>
    <!-- begin - reminder table -->
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
                                    <a onclick="confirmDialogGoTo('Tem certeza que deseja remover o lembrete desta nota?', '', 'KingNoteServlet?operacao=delReminder&idReminder=${reminder.getId()}')" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span> </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>

                </tbody>
            </table>
        </div>

        <div class="col-md-2"></div>
    </div>
    <!-- end - reminder table -->

    <!-- begin - reminder registration -->
    <h3>Cadastrar</h3> 
    <hr>
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
                <input type="hidden" id="dtp_input1" name="date" value=""><br>
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
    <!-- end - reminder registration -->
</div>
<!-- begin - content page reminder -->
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
<jsp:include page="includes/footer.jsp"  />