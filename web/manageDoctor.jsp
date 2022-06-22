<%-- 
    Document   : manageDoctor
    Created on : Jun 17, 2022, 10:09:37 PM
    Author     : QUANG VAN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="sample.user.DoctorDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Doctor Page</title>
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
                <input type="text" name="search"  value="<%= search%>" placeholder="Tìm kiếm bác sĩ..."/>
                <input type="submit" name="action"  value="Search" />

            </form>
        </div>

    </div>
    <div class="addNew">
        <a href="MainController?action=AddDoctor">Thêm Bác sĩ</a>
    </div>
    <div class="table-responsive">
        <%  List<DoctorDTO> list = (List<DoctorDTO>) session.getAttribute("LIST_DOCTOR");
            if (list != null) {
                if (!list.isEmpty()) {
        %>
        <c:set var="page" value="${sessionScope.page}"/>
        <div class="pagination">
            <c:forEach begin="${1}" end="${sessionScope.number}" var="i">
                <a class="${i==page?"active":""}" href="MainController?action=Show&page=${i}">${i}</a>
            </c:forEach>
        </div>
        <table border="1">
            <thead>
                <tr>
                    <th>Số thứ tự</th>
                    <th>Tài khoản</th>
                    <th>Họ và tên</th>
                    <th>Giới tính</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>
                    <th>Chuyên môn</th>
                    <th>Trạng Thái</th>
                    <th>Chi tiết</th>
                    <th>Cập nhật</th>
                    <th>Xóa</th>


                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (DoctorDTO doctor : list) {
                %>
            <form action="MainController?index=1">
                <tr>

                    <td><%=count++%></td>
                    <td><%=doctor.getUserID()%></td>
                    <td><%=doctor.getFullName()%></td>
                    <td><%=doctor.getGender()%></td>                                              
                    <td><%=doctor.getEmail()%></td>
                    <td><%=doctor.getPhone()%></td>
                    <td><%=doctor.getCategoryName()%></td>
                    <td><%=doctor.isStatus()%></td>

                    <td>
                        <a href=""
                           class="btn btn-success d-none d-md-inline-block text-white"
                           target="_blank">
                            <i class="fa-regular fa-eye"></i>
                            Chi tiết
                        </a>
                    </td>
                    <td>

                        <input type="hidden" name="fullName" value="<%=doctor.getFullName()%>"/>
                        <input type="hidden" name="gender" value="<%=doctor.getGender()%>"/>
                        <input type="hidden" name="address" value="<%=doctor.getAddress()%>"/>
                        <input type="hidden" name="email" value="<%=doctor.getEmail()%>"/>
                        <input type="hidden" name="phone" value="<%=doctor.getPhone()%>"/>
                        <input type="hidden" name="categoryName" value="<%=doctor.getCategoryName()%>"/>
                        <input type="hidden" name="serviceName" value="<%=doctor.getServiceName()%>"/>
                        <input type="hidden" name="image" value="<%=doctor.getImage()%>"/>
                        <input type="hidden" name="birthday" value="<%=doctor.getBirthday()%>"/>
                        <input type="hidden" name="status" value="<%=doctor.isStatus()%>"/>
                        <input type="submit"  name="action" value="Edit"/>
                    </td>

                    <td>
                        <form action="MainController">
                            <input type="hidden" name="doctorID" value="<%=doctor.getUserID()%>"/>
                            <input type="submit"  name="action" value="Delete"/>
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
