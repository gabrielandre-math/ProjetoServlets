package com.service.servlet.projeto.Controller;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet({"/home","/admin/home","/welcome", "/addNewUser", "/login", "/showAllUsers", "/loginfail", "/register"})
public class MainController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{

    }
}