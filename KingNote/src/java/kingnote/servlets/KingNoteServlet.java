package kingnote.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kingnote.main.KingNote;

public class KingNoteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String operacao = request.getParameter("operacao");

        // caminho padrao do Dispatcher
        String strDispatcher = "/index.jsp";
        // mantem somente uma instancia do obj KingNote
        KingNote kgnote = (KingNote) request.getSession().getAttribute("kingnote");
        if (kgnote == null) {
            kgnote = new KingNote();
        }

        if ("cadNote".equals(operacao)) {
            /**
             * Cadastra a nota
             */
            String title = request.getParameter("title");
            String text = request.getParameter("text");
            kgnote.addNote(title, text);
        } else if ("editNote".equals(operacao)) {
            /**
             * Edita a nota
             */
            String idNote = request.getParameter("idNote");
            String title = request.getParameter("title");
            String text = request.getParameter("text");
            kgnote.editNote(idNote, title, text);
        } else if ("addReminder".equals(operacao)) {
            /**
             * Adiciona um lembrete a uma nota
             */
            String idNote = request.getParameter("idNote");
            String title = request.getParameter("title");
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            Date dateReminder;
            try {
                dateReminder = (Date) formatter.parse(request.getParameter("date"));
            } catch (ParseException ex) {
                dateReminder = new Date(2000, 01, 01);
                Logger.getLogger(KingNoteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            kgnote.addReminder(idNote, title, dateReminder);
            strDispatcher = "/addReminder.jsp?id=" + idNote;
        } else if ("delReminder".equals(operacao)) {
            /**
             * Deleta um lembrete da nota
             */
            String idReminder = request.getParameter("idReminder");
            String idNote = kgnote.removeReminder(idReminder);
            if (!"".equals(idNote)) {
                strDispatcher = "/addReminder.jsp?id=" + idNote;
            }
        } else if ("delNote".equals(operacao)) {
            /**
             * "Deleta" nota, envia para lixeira
             */
            String idNote = request.getParameter("idNote");
            kgnote.removeNote(idNote);
        } else if ("delTrashNote".equals(operacao)) {
            /**
             * Deleta nota, exclusão definitiva da sessão
             */
            String idNote = request.getParameter("idNote");
            kgnote.removeTrash(idNote);
            strDispatcher = "/trash.jsp";
        } else if ("restoreTrashNote".equals(operacao)) {
            /**
             * Restaura nota da lixeira
             */
            String idNote = request.getParameter("idNote");
            kgnote.restoreTrash(idNote);
            strDispatcher = "/trash.jsp";
        } else if ("addCategory".equals(operacao)) {
            /**
             * Adidiona uma categoria a uma nota
             */
            String idNote = request.getParameter("idNote");
            String idCategory = request.getParameter("catexistente");
            String name = request.getParameter("nome");
            String color = request.getParameter("cor");
            if (idCategory == null) {
                idCategory = "";
            }
            if ("".equals(idCategory)) {
                kgnote.addCategory(idNote, name, color);
            } else {
                kgnote.addCategory(idNote, idCategory);
            }
            strDispatcher = "/addCategory.jsp?id=" + idNote;
        } else if ("delCategory".equals(operacao)) {
            /**
             * Deleta categoria de uma nota
             */
            String idCategory = request.getParameter("idCategory");
            String idNote = request.getParameter("idNote");
            kgnote.removeCategory(idNote, idCategory);
            if (!"".equals(idNote)) {
                strDispatcher = "/addCategory.jsp?id=" + idNote;
            }
        }
        // Aloca na sessão a alteração do obj KingNote
        request.getSession().setAttribute("kingnote", kgnote);
        ServletContext servletContext = request.getServletContext();
        RequestDispatcher dispatcher = servletContext.getRequestDispatcher(strDispatcher);
        dispatcher.forward(request, response);
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
