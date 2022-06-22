<%-- 
    Document   : managePatient
    Created on : Jun 19, 2022, 1:12:45 PM
    Author     : QUANG VAN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Patient Page</title>
    </head>
    <style>

        .pagination{
            display: inline-block;
        }
        .pagina a{
            color: black;
            font-size: 22px;
            float: left ;
            padding: 8px 16px;
            text-decoration: none;
        }
        .pagination a.active{
            background-color: #4CAF50;
            color: while;
        }
        .pagination a:hover:not(.active){
            background-color: chocolate;
        }
    </style>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("login.jsp");
            }

            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>

        <div class="content">     
            <form action="MainController">
                <input type="text" name="search"  value="<%= search%>" placeholder="Tìm kiếm bệnh nhân..."/>
                <input type="submit" name="action"  value="Tìm kiếm" />

            </form>
        </div>

    </div>

    <div class="table-responsive">
        <%  List<UserDTO> list = (List<UserDTO>) session.getAttribute("LIST_ALL_PATIENT");
            if (list != null) {
                if (!list.isEmpty()) {
        %>
        <c:set var="page" value="${sessionScope.page}"/>
        <div class="pagination">
            <c:forEach begin="${1}" end="${sessionScope.number}" var="i">
                <a class="${i==page?"active":""}" href="MainController?action=ShowAllPatient&page=${i}">${i}</a>
            </c:forEach>
        </div>
        <table border="1">
            <thead>
                <tr>
                    <th>Số thứ tự</th>
                    <th>Tài khoản</th>
                    <th>Họ và tên</th>
                    <th>Giới tính</th>
                    <th>Địa chỉ</th>
                    <th>Hình ảnh</th>
                    <th>Ngày sinh</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>                    
                    <th>Trạng Thái</th>
                    <th>Chi tiết</th>                    
                    <th>Xóa</th>


                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (UserDTO patient : list) {
                %>
            <form action="MainController">
                <tr>

                    <td><%=count++%></td>
                    <td><%=patient.getUserID()%></td>
                    <td><%=patient.getFullName()%></td>
                    <td><%=patient.getGender()%></td> 
                    <td><%=patient.getAddress()%></td>                                              
                    <td><%=patient.getImage()%></td>                                              
                    <td><%=patient.getBirthday()%></td>                                              
                    <td><%=patient.getEmail()%></td>
                    <td><%=patient.getPhone()%></td>                    
                    <td><%=patient.isStatus()%></td>

                    <td>
                        <a href=""
                           class="btn btn-success d-none d-md-inline-block text-white"
                           target="_blank">
                            <i class="fa-regular fa-eye"></i>
                            Chi tiết
                        </a>
                    </td>                    
                    <td>
                        <form action="MainController">
                            <input type="hidden" name="userID" value="<%=patient.getUserID()%>"/>
                            <input type="submit"  name="action" value="Xóa"/>
                        </form>

                    </td>   
                </tr>
            </form>
            <%
                }
            %>
            </tbody>
        </table>


        <%
                }
            }
        %> 
    </div>
</body>
</html>
