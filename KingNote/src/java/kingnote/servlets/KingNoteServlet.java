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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String operacao = request.getParameter("operacao");
        if ("cadNote".equals(operacao)) {
            KingNote kgnote = (KingNote) request.getSession().getAttribute("kingnote");
            if (kgnote == null) {
                kgnote = new KingNote();
            }
            String title = request.getParameter("title");
            String text = request.getParameter("text");
            kgnote.addNote(title, text);

            request.getSession().setAttribute("kingnote", kgnote);

            ServletContext servletContext = request.getServletContext();
            RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        } else if ("editNote".equals(operacao)) {
            KingNote kgnote = (KingNote) request.getSession().getAttribute("kingnote");
            if (kgnote == null) {
                kgnote = new KingNote();
            }
            String idNote = request.getParameter("idNote");
            String title = request.getParameter("title");
            String text = request.getParameter("text");
            kgnote.editNote(idNote, title, text);

            request.getSession().setAttribute("kingnote", kgnote);

            ServletContext servletContext = request.getServletContext();
            RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        } else if ("addReminder".equals(operacao)) {
            KingNote kgnote = (KingNote) request.getSession().getAttribute("kingnote");
            if (kgnote == null) {
                kgnote = new KingNote();
            }
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

            request.getSession().setAttribute("kingnote", kgnote);

            ServletContext servletContext = request.getServletContext();
            RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/addReminder.jsp?id=" + idNote);
            dispatcher.forward(request, response);
        } else if ("delReminder".equals(operacao)) {
            KingNote kgnote = (KingNote) request.getSession().getAttribute("kingnote");
            if (kgnote == null) {
                kgnote = new KingNote();
            }
            String idReminder = request.getParameter("idReminder");
            String idNote = kgnote.removeReminder(idReminder);

            request.getSession().setAttribute("kingnote", kgnote);

            ServletContext servletContext = request.getServletContext();
            RequestDispatcher dispatcher;
            if ("".equals(idNote)) {
                dispatcher = servletContext.getRequestDispatcher("/index.jsp");
            } else {
                dispatcher = servletContext.getRequestDispatcher("/addReminder.jsp?id=" + idNote);
            }
            dispatcher.forward(request, response);
        } else if ("delNote".equals(operacao)) {
            KingNote kgnote = (KingNote) request.getSession().getAttribute("kingnote");
            if (kgnote == null) {
                kgnote = new KingNote();
            }
            String idNote = request.getParameter("idNote");

            kgnote.removeNote(idNote);

            request.getSession().setAttribute("kingnote", kgnote);

            ServletContext servletContext = request.getServletContext();
            RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        } else if ("delTrashNote".equals(operacao)) {
            KingNote kgnote = (KingNote) request.getSession().getAttribute("kingnote");
            if (kgnote == null) {
                kgnote = new KingNote();
            }
            String idNote = request.getParameter("idNote");

            kgnote.removeTrash(idNote);

            request.getSession().setAttribute("kingnote", kgnote);

            ServletContext servletContext = request.getServletContext();
            RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/trash.jsp");
            dispatcher.forward(request, response);
        } else if ("restoreTrashNote".equals(operacao)) {
            KingNote kgnote = (KingNote) request.getSession().getAttribute("kingnote");
            if (kgnote == null) {
                kgnote = new KingNote();
            }
            String idNote = request.getParameter("idNote");

            kgnote.restoreTrash(idNote);

            request.getSession().setAttribute("kingnote", kgnote);

            ServletContext servletContext = request.getServletContext();
            RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/trash.jsp");
            dispatcher.forward(request, response);
        } else if ("addCategory".equals(operacao)) {
            KingNote kgnote = (KingNote) request.getSession().getAttribute("kingnote");
            if (kgnote == null) {
                kgnote = new KingNote();
            }
            String idNote = request.getParameter("idNote");
            String idCategory = request.getParameter("catexistente");

            String name = request.getParameter("nome");
            String color = request.getParameter("cor");
            if (idCategory == null) {
                idCategory = "";
            }
            if (idCategory.length() > 0) {
                kgnote.addCategory(idNote, idCategory);
            } else {
                kgnote.addCategory(idNote, name, color);
            }

            request.getSession().setAttribute("kingnote", kgnote);

            ServletContext servletContext = request.getServletContext();
            RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/addCategory.jsp?id=" + idNote);
            dispatcher.forward(request, response);
        } else if ("delCategory".equals(operacao)) {
            KingNote kgnote = (KingNote) request.getSession().getAttribute("kingnote");
            if (kgnote == null) {
                kgnote = new KingNote();
            }
            String idCategory = request.getParameter("idCategory");
            String idNote = request.getParameter("idNote");

            kgnote.removeCategory(idNote, idCategory);

            request.getSession().setAttribute("kingnote", kgnote);

            ServletContext servletContext = request.getServletContext();
            RequestDispatcher dispatcher;
            if ("".equals(idNote)) {
                dispatcher = servletContext.getRequestDispatcher("/index.jsp");
            } else {
                dispatcher = servletContext.getRequestDispatcher("/addCategory.jsp?id=" + idNote);
            }
            dispatcher.forward(request, response);
        }
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
