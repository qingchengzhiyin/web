package com.servlet;

import com.entity.House;
import com.mapper.Mapper;
import com.util.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import org.apache.ibatis.session.SqlSession;

public class AdminHouseServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession()) {
            Mapper houseMapper = sqlSession.getMapper(Mapper.class);
            List<House> houseList = houseMapper.getAllHouses();

            // 将房源列表存储在 request 属性中
            request.setAttribute("houseList", houseList);

            // 转发请求到 admin_house_management.jsp 页面进行展示
            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_house_management.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
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
            String houseId = request.getParameter("houseId");
            String address = request.getParameter("address");
            int price = Integer.parseInt(request.getParameter("price"));
            int checkStatement = Integer.parseInt(request.getParameter("checkStatement"));
            int hostUserId = Integer.parseInt(request.getParameter("hostUserId"));
            String image = request.getParameter("image");
            String title = request.getParameter("title");
            try (SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession()) {
                Mapper houseMapper = sqlSession.getMapper(Mapper.class);

                // 根据 houseId 获取房源信息
                House house = houseMapper.getHouseById(Integer.parseInt(houseId));
                if (house != null) {
                    // 更新房源信息
                    house.setAddress(address);
                    house.setPrice(price);
                    house.setCheckStatement(checkStatement);
                    house.setHostUserId(hostUserId);
                    house.setImage(image);
                    house.setTitle(title);
                    houseMapper.updateHouse(house);
                    sqlSession.commit();
                }
            } catch (Exception e) {
                e.printStackTrace();
                // 错误处理
            }
        } else if ("add".equals(action)) {
            try (SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession()) {
                Mapper houseMapper = sqlSession.getMapper(Mapper.class);

                // 获取添加房源信息的参数
                String address = request.getParameter("newAddress");
                int price = Integer.parseInt(request.getParameter("newPrice"));
                int checkStatement = Integer.parseInt(request.getParameter("newCheckStatement"));
                int hostUserId = Integer.parseInt(request.getParameter("newHostUserId"));
                String image = request.getParameter("newImage");
                String title = request.getParameter("newTitle");

                House newHouse = new House(address,price,checkStatement,hostUserId,image,title);
                // 设置房源信息
                newHouse.setAddress(address);
                // 设置其他房源信息

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
