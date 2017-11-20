<%@ page contentType="text/html" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" scope="request" value="Notas - KingNote"/>
<jsp:include page="includes/header.jsp"  />
<!-- INICIO CONTEUDO -->
<div class="container">
    <div class="page-header">
        <h1>Notas</h1>
    </div>

    <div class="row">
        <div class="col-md-3" id="notepad">
            <form action="KingNoteServlet" method="POST">
                <input type="hidden" name="operacao" value="cadNote"/>
                <div class="row" id="top">
                    <input type="text" name="title" id="title" autocomplete="off" onkeyup="noteChanged()" onfocus="$(this).css('backgroundPosition', '0 -29px')"
                           onblur="$(this).css('backgroundPosition', '0 0')" style="background-position: 0px 0px;">
                    <div id="note-buttons">
                        <button type="submit" class="button-no-style">
                            <span class="glyphicon glyphicon-floppy-disk"></span> 
                        </button>
                    </div>
                </div>
                <div class="row" id="body-container">
                    <div class="col-md-12">
                        <textarea id="body" name="text" onkeyup="noteChanged()" style="height: 250px;"></textarea>
                    </div>
                </div>
            </form>
        </div>

        <c:if test="${sessionScope.kingnote.getNotes() != null}">
            <c:forEach items="${sessionScope.kingnote.getNotes()}" var="note">
                <div class="col-md-3" id="notepad">
                    <form action="KingNoteServlet" method="POST">
                        <input type="hidden" name="operacao" value="editNote"/>
                        <input type="hidden" name="idNote" value="${note.getId()}"/>
                        <div class="row" id="top">
                            <input type="text" name="title" id="title" autocomplete="off" value="${note.getTitle()}" onkeyup="noteChanged()" onfocus="$(this).css('backgroundPosition', '0 -29px')"onblur="$(this).css('backgroundPosition', '0 0')" style="background-position: 0px 0px;" >
                            <div id="note-buttons">
                                <button type="submit" class="button-no-style">
                                    <span class="glyphicon glyphicon-floppy-disk"></span> 
                                </button>
                                <a href="addReminder.jsp?id=${note.getId()}" title="Lembrete" > <span class="glyphicon glyphicon-time" style="color: #08c;"></span>          </a>
                                <a href="addCategory.jsp?id=${note.getId()}" title="Categoria" > <span class="glyphicon glyphicon-tags" style="color: orange;"></span>          </a>
                                <a href="KingNoteServlet?operacao=delNote&idNote=${note.getId()}" title="Excluir"> <span class="glyphicon glyphicon-trash" style="color: red;"></span>        </a>
                            </div>
                        </div>
                        <div class="row" id="body-container">
                            <div class="col-md-12">
                                <textarea id="body" name="text" onkeyup="noteChanged()" style="height: 250px;">${note.getText()}</textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${sessionScope.kingnote.getNotes() == null}">
            Não há notas a exibir
        </c:if>
    </div>
</div>

<jsp:include page="includes/footer.jsp"  />