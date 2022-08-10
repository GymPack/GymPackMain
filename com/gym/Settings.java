/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gym;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;

/**
 *
 * @author Trev
 */
public class Settings extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String upemail = request.getParameter("newemail");
            String uppass = request.getParameter("newpass");
            String upid = request.getParameter("newid");
            out.println(upemail);
            out.println(uppass);
            HttpSession session = request.getSession();
            
            DBConnect connect = new DBConnect();
            Connection con1 = connect.getStatement();  
            Connection con2 = connect.getConnection();
            Statement stmt1 = con1.createStatement();
            Statement stmt2 = con2.createStatement();
            String sql1 = "Select Email from user where Email = '"+upemail+"'";
            String sql2 = "Select Password from user where Password = '"+uppass+"'";
            ResultSet res1 = stmt1.executeQuery(sql1);
            ResultSet res2 = stmt2.executeQuery(sql2);
            
            //out.println(res1.next());
            if(res1.next() && res2.next()){
                session.setAttribute("status", "noChange");
                response.sendRedirect("gymsettings.jsp");
            }
            else if(res1.next() || !res2.next()){      
                Connection con3 = connect.getConnection1();
                Statement stmt3 = con3.createStatement();
                stmt3.executeUpdate("Update user set Password = '"+uppass+"' where UserID = '"+upid+"'");
                session.setAttribute("status", "passChange");
                response.sendRedirect("gymsettings.jsp");
                con3.close();
            }
            else if(res2.next() || !res1.next()){ 
                Connection con4 = connect.getConnection2();
                Statement stmt4 = con4.createStatement();              
                stmt4.executeUpdate("Update user set Email = '"+upemail+"' where UserID = '"+upid+"'");
                session.setAttribute("status", "emailChange");
                response.sendRedirect("gymsettings.jsp");
                con4.close();
            }
            if(con1 != null){
                con1.close();
            }
            if(con2 != null){
                con2.close();
            }

        } catch (SQLException es) {
            es.getMessage();
        } catch (ClassNotFoundException ex) {
            ex.getMessage();
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
