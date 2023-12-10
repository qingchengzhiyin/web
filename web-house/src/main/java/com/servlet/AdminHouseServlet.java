package com.servlet;

import com.entity.House;
import com.entity.User;
import com.mapper.Mapper;
import com.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;


public class AdminHouseServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession()) {
            Mapper houseMapper = sqlSession.getMapper(Mapper.class);
            List<House> houseList = houseMapper.getAllHouses();

            // 将用户列表存储在 request 属性中
            request.setAttribute("houseList", houseList);

            // 转发请求到 admin_user_management.jsp 页面进行展示
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_house_management.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
//            System.out.println("删除");
            String houseId = request.getParameter("houseId");

            try (SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession()) {
                Mapper houseMapper = sqlSession.getMapper(Mapper.class);
                houseMapper.deleteHouseById(Integer.parseInt(houseId));
                sqlSession.commit();
            } catch (Exception e) {
                e.printStackTrace();
                // 错误处理
            }
        } else if ("edit".equals(action)) {
//            System.out.println("1");
            String houseId = request.getParameter("houseId");
//            System.out.println("成功");
            String address = request.getParameter("address");
            int price = Integer.parseInt(request.getParameter("price"));
            int checkStatement = Integer.parseInt(request.getParameter("checkStatement"));
            String dateString = request.getParameter("time");
            SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
            Date time = null;

            try {
                time = formatter.parse(dateString);
            } catch (ParseException e) {
                e.printStackTrace();
            }


            int rentStatement = Integer.parseInt(request.getParameter("rentStatement"));
            int hostId = Integer.parseInt(request.getParameter("hostId"));
            int rentUserId = Integer.parseInt(request.getParameter("rentUserId"));

//            System.out.println("2");
            try (SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession()) {
                Mapper houseMapper = sqlSession.getMapper(Mapper.class);

                // 根据 userId 获取用户信息
                House house = houseMapper.getHouseById(Integer.parseInt(houseId));
                if (house != null) {
                    // 更新用户信息
                    house.setAddress(address);
                    house.setCheckStatement(checkStatement);
                    house.setPrice(price);
                    house.setTime(time);
                    house.setHostId(hostId);
                    house.setRentStatement(rentStatement);
//                    System.out.println('3');
                    houseMapper.updateHouse(house);
                    sqlSession.commit();
                }
            } catch (Exception e) {
                e.printStackTrace();
                // 错误处理
            }
        }else if ("add".equals(action)){
            try (SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession()) {
                Mapper houseMapper = sqlSession.getMapper(Mapper.class);

//            System.out.println("成功");
                String address = request.getParameter("newAddress");
                int price = Integer.parseInt(request.getParameter("newPrice"));
                int checkStatement = Integer.parseInt(request.getParameter("newCheckStatement"));
                String dateString = request.getParameter("newTime");
                SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
                Date time = null;

                try {
                    time = formatter.parse(dateString);
                } catch (ParseException e) {
                    e.printStackTrace();
                }


                int rentStatement = Integer.parseInt(request.getParameter("newRentStatement"));
                int hostId = Integer.parseInt(request.getParameter("newHostId"));
                int rentUserId = Integer.parseInt(request.getParameter("newRentUserId"));

                House newHouse = new House(address, price, checkStatement, time, rentStatement, hostId, rentUserId);
//                System.out.println(userName);

                houseMapper.addHouse(newHouse);
                sqlSession.commit();
            } catch (Exception e) {
                e.printStackTrace();
                // 错误处理
            }

        }

        response.sendRedirect(request.getContextPath() + "/admin/houses");
    }


}
