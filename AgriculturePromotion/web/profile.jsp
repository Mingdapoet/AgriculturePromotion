<%-- 
    Document   : profile
    Created on : May 20, 2025, 1:31:17 AM
    Author     : trvie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="domain.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Information | Agriculture Promotion</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2>Thông tin cá nhân</h2>
            <table class="table table-bordered w-75">
                <tr>
                    <th>Email</th>
                    <td><%= user.getEmail() %></td>
                </tr>
                <tr>
                    <th>Role</th>
                    <td><%= user.getRole() %></td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td><%= user.getPhone() %></td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td><%= user.getAddress() %></td>
                </tr>
                <tr>
                    <th>Birthdate</th>
                    <td>
                        <%= user.getBirthday()%>
                    </td>
                </tr>
            </table>
            <a href="editProfile.jsp" class="btn btn-warning">Chỉnh sửa thông tin</a>        
            <a href="index.jsp" class="btn btn-primary">Quay lại trang chủ</a>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
