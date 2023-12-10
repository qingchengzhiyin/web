package com.servlet;

import com.entity.User;
import com.mapper.Mapper;
import com.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import org.apache.ibatis.session.SqlSession;


public class AdminUserServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession()) {
            Mapper userMapper = sqlSession.getMapper(Mapper.class);
            List<User> userList = userMapper.getAllUsers();

            // 将用户列表存储在 request 属性中
            request.setAttribute("userList", userList);

            // 转发请求到 admin_user_management.jsp 页面进行展示
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_user_management.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
//            System.out.println("删除");
            String userId = request.getParameter("userId");

            try (SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession()) {
                Mapper userMapper = sqlSession.getMapper(Mapper.class);
                userMapper.deleteUserById(Integer.parseInt(userId));
                sqlSession.commit();
            } catch (Exception e) {
                e.printStackTrace();
                // 错误处理
            }
        } else if ("edit".equals(action)) {
//            System.out.println("成功");
            String userId = request.getParameter("userId");
            String username = request.getParameter("username");
            String phone = request.getParameter("phone");


            try (SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession()) {
                Mapper userMapper = sqlSession.getMapper(Mapper.class);

                // 根据 userId 获取用户信息
                User user = userMapper.getUserById(Integer.parseInt(userId));
                if (user != null) {
                    // 更新用户信息
                    user.setUsername(username);
                    user.setPhone(phone);
                    userMapper.updateUser(user);
                    sqlSession.commit();
                }
            } catch (Exception e) {
                e.printStackTrace();
                // 错误处理
            }
        }else if ("add".equals(action)){
            try (SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession()) {
                Mapper userMapper = sqlSession.getMapper(Mapper.class);

                String userName = request.getParameter("newUsername");
                String userPassword = request.getParameter("newPassword");
                String phone = request.getParameter("newPhone");
                User newUser = new User(userName,userPassword,phone);
//                System.out.println(userName);

                userMapper.addUser(newUser);
                sqlSession.commit();
            } catch (Exception e) {
                e.printStackTrace();
                // 错误处理
            }

        }

        response.sendRedirect(request.getContextPath() + "/admin/users");
    }


}
