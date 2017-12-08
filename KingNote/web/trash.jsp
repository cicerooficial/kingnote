<%@ page contentType="text/html" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" scope="request" value="Lixeira - KingNote"/>
<jsp:include page="includes/header.jsp"  />
<!-- begin - content page index -->
<div class="container">
    <div class="page-header">
        <h1>Lixeira</h1>
    </div>
    <!-- begin - list trash notes -->
    <div class="row">
        <div class="col-md-12">
            <c:if test="${sessionScope.kingnote.getTrash() != null}">
                <c:forEach items="${sessionScope.kingnote.getTrash()}" var="note">
                    <div class="col-md-3" id="notepad">
                        <div class="row" id="top">
                            <input type="hidden" id="noteId" value="${note.getId()}" />
                            <input type="text" name="title" id="title" autocomplete="off" value="${note.getTitle()}" onkeyup="noteChanged()" onfocus="$(this).css('backgroundPosition', '0 -29px')"onblur="$(this).css('backgroundPosition', '0 0')" style="background-position: 0px 0px;" >
                            <div id="note-buttons">
                                <a href="KingNoteServlet?operacao=restoreTrashNote&idNote=${note.getId()}" title="Restaurar" > <span class="glyphicon glyphicon-arrow-left"></span>   </a>
                                <a onclick="confirmDialogGoTo('Tem certeza que deseja remover a nota definitivamente?', '' , 'KingNoteServlet?operacao=delTrashNote&idNote=${note.getId()}')"  title="Excluir"> <span class="glyphicon glyphicon-trash"></span>        </a>
                            </div>
                        </div>
                        <div class="row" id="body-container">
                            <div class="col-md-12">
                                <textarea id="body" onkeyup="noteChanged()" style="height: 250px;">${note.getText()}</textarea>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${sessionScope.kingnote.getTrash().size() == 0}">
                <h3>
                    <p class="text-center ">Lixeira vazia</p>
                </h3>
            </c:if>

        </div> 
    </div>
    <!-- end - list trash notes -->
</div>
<!-- begin - content page index -->
<jsp:include page="includes/footer.jsp"  />