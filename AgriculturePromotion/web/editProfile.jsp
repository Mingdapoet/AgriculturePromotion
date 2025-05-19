<%-- 
    Document   : editProfile
    Created on : May 20, 2025, 1:53:36 AM
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Information | Agriculture Promotion</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2>Chỉnh sửa thông tin cá nhân</h2>
            <form action="Accountưerwer" method="post" class="w-50">

                <!-- Email (readonly) -->
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>" readonly />
                </div>

                <!-- Role (readonly) -->
                <div class="mb-3">
                    <label for="role" class="form-label">Role</label>
                    <input type="text" class="form-control" id="role" name="role" value="<%= user.getRole() %>" readonly />
                </div>

                <!-- Phone (editable) -->
                <div class="mb-3">
                    <label for="phone" class="form-label">Số điện thoại</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="<%= user.getPhone() != null ? user.getPhone() : "" %>" />
                </div>

                <!-- Address (editable) -->
                <div class="mb-3">
                    <label for="address" class="form-label">Địa chỉ</label>
                    <textarea class="form-control" id="address" name="address" rows="3"><%= user.getAddress() != null ? user.getAddress() : "" %></textarea>
                </div>

                <!-- Birthday (editable) -->
                <div class="mb-3">
                    <label for="birthday" class="form-label">Ngày sinh</label>
                    <input type="date" class="form-control" id="birthday" name="birthday" 
                           value="<%= user.getBirthday() != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(user.getBirthday()) : "" %>" />
                </div>

                <!-- Nút submit -->
                <button type="submit" class="btn btn-success">Lưu thay đổi</button>
                <a href="profile.jsp" class="btn btn-secondary ms-2">Hủy</a>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
