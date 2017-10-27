/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

/**
 *
 * @author rubens
 */
public class KingNoteServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String operacao = request.getParameter("operacao");
        if ("cad".equals(operacao)) {
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
        } else if ("addReminder".equals(operacao)) {
            KingNote kgnote = (KingNote) request.getSession().getAttribute("kingnote");
            if (kgnote == null) {
                kgnote = new KingNote();
            }
            String idNote = request.getParameter("idNote");
            String title = request.getParameter("title");
            DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm"); 
            Date dateReminder;
            try {
                dateReminder = (Date)formatter.parse(request.getParameter("date"));
            } catch (ParseException ex) {
                dateReminder = new Date(2000, 01, 01);
                Logger.getLogger(KingNoteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            kgnote.addReminder(idNote, title, dateReminder);
            

            request.getSession().setAttribute("kingnote", kgnote);

            ServletContext servletContext = request.getServletContext();
            RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/addLembrete.jsp?id="+idNote);
            dispatcher.forward(request, response);
        }
    }


// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
/**
 * Handles the HTTP <code>GET</code> method.
 *
 * @param request servlet request
 * @param response servlet response
 * @throws ServletException if a servlet-specific error occurs
 * @throws IOException if an I/O error occurs
 */
@Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
        public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


 

}