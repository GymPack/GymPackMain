/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gym;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 *
 * @author 840
 */
@WebServlet(name = "updatePackage", urlPatterns = {"/updatePackage"})
public class updatePackage extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            try{
               Class.forName("com.mysql.jdbc.Driver");
               try{
                   HttpSession session=request.getSession();
                   Connection co= DriverManager.getConnection("jdbc:mysql://localhost:3306/Gympack","root","");
                   String prodName=request.getParameter("prodName");
                   String category=request.getParameter("category");
                   String amount=request.getParameter("amount");
                   String unitPrice=request.getParameter("price");
                   String image=request.getParameter("image");
                   String eid = request.getParameter("id");
                   
                   int id=Integer.parseInt(eid);
                   
                   String query="UPDATE `products` SET `prodName` = '"+prodName+"', `category` = '"+category+"', `ammount` = '"+amount+"', `unitPrice` = '"+unitPrice+"', `image` = '"+image+"' WHERE (`id` = '"+id+"');";
                   PreparedStatement statement=co.prepareStatement(query);
                   int row = statement.executeUpdate();
                   if(row > 0){
                       response.sendRedirect("display.jsp");
                   }

               }catch(SQLException e2){
                   out.println(e2.getMessage());
               }
           }catch(ClassNotFoundException e){
               out.println(e.getMessage());
           }

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
