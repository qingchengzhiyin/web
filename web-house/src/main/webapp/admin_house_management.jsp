<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    <h2>House Management</h2>

    <!-- Add User Button -->
    <button type="button" class="btn btn-success mb-3" data-toggle="modal" data-target="#addHouseModal">
      添加房源
    </button>

    <!-- Add User Modal -->
    <div class="modal fade" id="addHouseModal" tabindex="-1" role="dialog" aria-labelledby="addHouseModalLabel" aria-hidden="true">
      <!-- Modal Content for Adding House -->
      <!-- Add House Form -->
      <form id="addForm" action="/web/admin/houses" method="post">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="addHouseModalLabel">添加房源</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label for="newAddress">地址</label>
                <input type="text" class="form-control" id="newAddress" name="newAddress" placeholder="请输入地址">
              </div>
              <div class="form-group">
                <label for="newPrice">密码</label>
                <input type="text" class="form-control" id="newPrice" name="newPrice" placeholder="请输入价格">
              </div>
              <div class="form-group">
                <label for="newCheckStatement">审核情况</label>
                <input type="text" class="form-control" id="newCheckStatement" name="newCheckStatement" placeholder="请输入审核情况">
              </div>
              <div class="form-group">
                <label for="newTime">发布时间</label>
                <input type="text" class="form-control" id="newTime" name="newTime" placeholder="请输入发布时间">
              </div>
              <div class="form-group">
                <label for="newRentStatement">租住情况</label>
                <input type="text" class="form-control" id="newRentStatement" name="newRentStatement" placeholder="请输入租住情况">
              </div>
              <div class="form-group">
                <label for="newHostId">房东</label>
                <input type="text" class="form-control" id="newHostId" name="newHostId" placeholder="请输入房东">
              </div>
              <div class="form-group">
                <label for="newRentUserId">租户</label>
                <input type="text" class="form-control" id="newRentUserId" name="newRentUserId" placeholder="请输入房东">
              </div>
              <!-- Hidden field for action -->
              <input type="hidden" name="action" value="add">
            </div>
            <div class="modal-footer">
              <!-- Submit button -->
              <button type="submit" class="btn btn-primary">添加房源</button>
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
            <th scope="col">House ID</th>
            <th scope="col">address</th>
            <th scope="col">price</th>
            <th scope="col">checkStatement</th>
            <th scope="col">time</th>
            <th scope="col">rentStatement</th>
            <th scope="col">hostId</th>
            <th scope="col">rentUserId</th>
            <th scope="col">action</th>
          </tr>
        </thead>
        <tbody>
          <!-- Sample user data rendered dynamically using JSTL -->
          <c:forEach items="${houseList}" var="house">
            <tr>
              <th scope="row">${house.houseId}</th>
              <td>${house.address}</td>
              <td>${house.price}</td>
              <td>${house.checkStatement}</td>
              <td>${house.time}</td>
              <td>${house.rentStatement}</td>
              <td>${house.hostId}</td>
              <td>${house.rentUserId}</td>

              <td>

                <!-- 触发模态框的编辑按钮 -->
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editHouseModal${house.houseId}">
                                Edit
                            </button>
                            <!-- 模态框 -->
                            <div class="modal fade" id="editHouseModal${house.houseId}" tabindex="-1" role="dialog" aria-labelledby="editHouseModalLabel" aria-hidden="true">
                                <!-- 模态框内容 -->
                                <!-- 编辑用户的表单 -->
                                <form id="editForm${house.houseId}" action="/web/admin/houses" method="post">
                                    <!--<input type="hidden" id="editAction${house.houseId}" name="action" value=""> -->

                                    <!-- 输入框 -->
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="editHouseModalLabel">Edit User</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="address">address</label>
                                                    <input type="text" class="form-control" id="address" name="address" value="${house.address}">
                                                </div>
                                                <div class="form-group">
                                                    <label for="price">price</label>
                                                    <input type="text" class="form-control" id="price" name="price" value="${house.price}">
                                                </div>
                                                <div class="form-group">
                                                      <label for="checkStatement">checkstatement</label>
                                                      <input type="text" class="form-control" id="checkStatement" name="checkStatement" value="${house.checkStatement}">
                                                  </div>
                                                  <div class="form-group">
                                                      <label for="time">time</label>
                                                      <input type="text" class="form-control" id="time" name="time" value="${house.time}">
                                                  </div>
                                                <div class="form-group">
                                                    <label for="rentStatement">price</label>
                                                    <input type="text" class="form-control" id="rentStatement" name="rentStatement" value="${house.rentStatement}">
                                                </div>
                                                <div class="form-group">
                                                      <label for="hostId">hostId</label>
                                                      <input type="text" class="form-control" id="hostId" name="hostId" value="${house.hostId}">
                                                  </div>
                                                  <div class="form-group">
                                                      <label for="rentUserId">rentUserId</label>
                                                      <input type="text" class="form-control" id="rentUserId" name="rentUserId" value="${house.rentUserId}">
                                                  </div>
                                                <!-- 隐藏房源ID -->
                                                <input type="hidden" name="houseId" value="${house.houseId}">
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

               <form action="/web/admin/houses" method="post">
                   <input type="hidden" name="action" value="delete">
                   <input type="hidden" name="houseId" value="${house.houseId}">
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
