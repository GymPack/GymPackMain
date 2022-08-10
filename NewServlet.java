/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.gym;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author 840
 */
@WebServlet(name = "NewServlet", urlPatterns = {"/NewServlet"})
public class NewServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       // String name=request.getParameter("name");
       PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
       try{
           Class.forName("com.mysql.jdbc.Driver");
           try{
               
               Getconnection con= new Getconnection();
               con.getconnections();
               String prodName=request.getParameter("prodName");
               String category=request.getParameter("category");
               String amount=request.getParameter("amount");
               String unitPrice=request.getParameter("price");
               String image=request.getParameter("image");
               String query="INSERT INTO `products`(`prodName`, `category`, `ammount`, `unitPrice`,`image`) VALUES ('"+prodName+"', '"+category+"', '"+amount+"', '"+unitPrice+"','"+image+"')";
               PreparedStatement statement=con.co.prepareStatement(query);
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
}

 