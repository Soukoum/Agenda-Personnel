/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(urlPatterns = {"/ModifEvenement"})
public class ModifEvenement extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
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
        this.getServletContext().getRequestDispatcher("/ModifierEvenement.jsp").forward(request, response);
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
        String p1 = request.getParameter("nom");
        String p2 = request.getParameter("date_debut");
        String p3 = request.getParameter("date_fin");
        String p4 = request.getParameter("heure_debut");
        String p5 = request.getParameter("heure_fin");
        String p6 = request.getParameter("lieu");
        String p7 = request.getParameter("categorie");
        String p8 = request.getParameter("participants");
        String p9 = request.getParameter("commentaires");
        String p10 = request.getParameter("priorite");
        int id = Integer.parseInt(request.getParameter("id"));
        Connection connecter = null;
        String requete = "UPDATE evenement set nom='"+p1+"', dateDebut='"+p2+"', dateFin='"+p3+"', heureDebut='"+p4+"', heureFin='"+p5+"', lieu='"+p6+"', categorie='"+p7+"', participants='"+p8+"', commentaires='"+p9+"', priorite='"+p10+"' where id='"+id+"';";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/agenda";
            connecter = DriverManager.getConnection(url, "root", "root");
            Statement stmt = connecter.createStatement();
            stmt.executeUpdate(requete);
            request.setAttribute("msg","Evènement modifié avec succès");
            this.getServletContext().getRequestDispatcher("/listeEvenement.jsp").forward(request, response);
        }
        catch(Exception e){
            e.printStackTrace();
        }
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
