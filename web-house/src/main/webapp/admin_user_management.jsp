<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>。

<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>User Management - Admin Panel</title>
  <!-- Include Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    /* Optional: Custom styles */
    /* Adjust table heading styles */
    th {
      font-weight: bold;
    }
    /* Hover effect on table rows */
    tbody tr:hover {
      background-color: #f5f5f5;
    }
  </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">

    <!-- 左侧导航 -->
    <div class="navbar-nav mr-auto">
      <a class="nav-item nav-link" href="#">Home</a>
      <a class="nav-item nav-link" href="#">Users</a>
      <a class="nav-item nav-link" href="#">House Listings</a>
    </div>

    <!-- 中间空白区域 -->
    <div class="navbar-brand mx-auto"></div>

    <!-- 右侧导航 -->
    <div class="navbar-nav ml-auto">
      <a class="nav-item nav-link" href="#">Statistics</a>
      <a class="nav-item nav-link" href="#">Logout</a>
    </div>

  </div>
</nav>

  <!-- Banner with Welcome Message -->
  <div class="banner bg-light py-4">
    <div class="container text-center">
      <h1>Welcome Admin!</h1>
      <!-- Dynamic welcome message using JSTL -->
      <p>Welcome, <%-- JSTL variable for admin name --%> ${adminName}</p>
    </div>
  </div>

  <!-- Navigation Bar -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
      <a class="navbar-brand" href="#">Admin Panel</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Users</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">House Listings</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Statistics</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- User Information Table -->
  <div class="container mt-4">
    <h2>User Management</h2>

    <!-- Add User Button -->
    <button type="button" class="btn btn-success mb-3" data-toggle="modal" data-target="#addUserModal">
      添加用户
    </button>

    <!-- Add User Modal -->
    <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel" aria-hidden="true">
      <!-- Modal Content for Adding User -->
      <!-- Add User Form -->
      <form id="addForm" action="/web/admin/users" method="post">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="addUserModalLabel">添加用户</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label for="newUsername">用户名</label>
                <input type="text" class="form-control" id="newUsername" name="newUsername" placeholder="请输入用户名">
              </div>
              <div class="form-group">
                <label for="newPassword">密码</label>
                <input type="text" class="form-control" id="newPassword" name="newPassword" placeholder="请输入密码">
              </div>
              <div class="form-group">
                <label for="newPhone">手机号</label>
                <input type="text" class="form-control" id="newPhone" name="newPhone" placeholder="请输入手机号">
              </div>
              <!-- Hidden field for action -->
              <input type="hidden" name="action" value="add">
            </div>
            <div class="modal-footer">
              <!-- Submit button -->
              <button type="submit" class="btn btn-primary">添加用户</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>
          </div>
        </div>
      </form>
    </div>



    <div class="table-responsive">
      <table class="table table-bordered">
        <thead class="thead-light">
          <tr>
            <th scope="col">User ID</th>
            <th scope="col">Username</th>
            <th scope="col">Phone</th>
            <th scope="col">Actions</th>
          </tr>
        </thead>
        <tbody>
          <!-- Sample user data rendered dynamically using JSTL -->
          <c:forEach items="${userList}" var="user">
            <tr>
              <th scope="row">${user.id}</th>
              <td>${user.username}</td>
              <td>${user.phone}</td>
              <td>

                <!-- 触发模态框的编辑按钮 -->
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editUserModal${user.id}">
                                Edit
                            </button>
                            <!-- 模态框 -->
                            <div class="modal fade" id="editUserModal${user.id}" tabindex="-1" role="dialog" aria-labelledby="editUserModalLabel" aria-hidden="true">
                                <!-- 模态框内容 -->
                                <!-- 编辑用户的表单 -->
                                <form id="editForm${user.id}" action="/web/admin/users" method="post">
                                    <!--<input type="hidden" id="editAction${user.id}" name="action" value=""> -->

                                    <!-- 输入框 -->
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="username">Username</label>
                                                    <input type="text" class="form-control" id="username" name="username" value="${user.username}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="phone">Phone</label>
                                                    <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}">
                                                </div>
                                                <!-- 隐藏用户ID -->
                                                <input type="hidden" name="userId" value="${user.id}">
                                                <input type="hidden" name="action" value="edit">
                                            </div>
                                            <div class="modal-footer">
                                                <!-- 提交按钮 -->
                                                <button type="submit" class="btn btn-primary">Save Changes</button>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

               <form action="/web/admin/users" method="post">
                   <input type="hidden" name="action" value="delete">
                   <input type="hidden" name="userId" value="${user.id}">
                   <button type="submit" class="btn btn-danger btn-sm">Delete</button>
               </form>

              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>

  <!-- Footer -->
  <footer class="footer mt-4 py-3 bg-light">
    <div class="container text-center">
      <p>&copy; 2023 Your Company</p>
    </div>
  </footer>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- Include Bootstrap JS -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>
