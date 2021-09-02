/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.web.project.servlet;

import com.web.project.dao.UserDao;
import com.web.project.entities.User;
import com.web.project.helper.THE_CONNECTION;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class RegisterServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          
          
            
//            fetch all data from form
             String check= request.getParameter("check");
             if(check==null){
                 out.println("Please Check Term And Condition");
             }else{
             String name= request.getParameter("user_name");
             String email= request.getParameter("user_email");
             String password= request.getParameter("user_password");
             String gender= request.getParameter("gender");
             String about= request.getParameter("about");
             
//             create user object and set all data to that object
             User user=new User(name,email,password,gender,about);
             
             
//              create a user dao object
             UserDao dao=new UserDao(THE_CONNECTION.getConnection());
             if(dao.saveUser(user)){
                 out.println("done");
             }else{
                 out.println("This email has already been registered!!! Please try with another");
             }
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
