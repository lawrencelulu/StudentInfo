<%--
  Created by IntelliJ IDEA.
  User: lhj
  Date: 2021/4/7
  Time: 11:06 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="./adminLeft.jsp" />
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h4>教学班管理</h4>
                    </div>
                    <div class="col-sm-6">
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
<%--                            <div class="card-header">--%>
<%--                                <h3 class="card-title">DataTable with minimal features & hover style</h3>--%>
<%--                            </div>--%>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>教学班</th>
                                        <th>课程编号</th>
                                        <th>课程名</th>
                                        <th>任课教师</th>
                                        <th>开课学期</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="courseplan" items="${sessionScope.coursePlanList}">
                                        <tr>
                                            <td>${courseplan.courseclass }</td>
                                            <td>${courseplan.cid}</td>
                                            <td>${courseplan.cname }</td>
                                            <td>${courseplan.tname }</td>
                                            <td>${courseplan.semester }</td>
                                            <td>
                                                <button type="button" class="btn btn-default" onclick="add('${courseplan.courseclass}')">开启评教</button>
                                                <a class="btn btn-default" href="/StudentInfo/CoursePlanHandler/delcouplan/${courseplan.courseclass}">结班</a>
                                            </td>

                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <div class="row">
                                    <!--分页文字信息  -->
                                    <div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
                                        页,总 ${pageInfo.total } 条记录</div>
                                    <!-- 分页条信息 -->
                                    <div class="col-md-6">
                                        <nav aria-label="Page navigation">
                                            <ul class="pagination">
<%--                                                <c:if test="${pageInfo.hasPreviousPage }">--%>
<%--                                                    <li><a href="/StudentInfo/AdminHandler/managecou/${pageInfo.pageNum-1}"--%>
<%--                                                           aria-label="Previous"> <span aria-hidden="true">«</span>--%>
<%--                                                    </a></li>--%>
<%--                                                </c:if>--%>

                                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                                    <c:if test="${page_Num == pageInfo.pageNum }">
                                                        <li class="active page-item"><a class="page-link" href="#">${page_Num }</a></li>
                                                    </c:if>
                                                    <c:if test="${page_Num != pageInfo.pageNum }">
                                                        <li class="page-item">
                                                            <a class="page-link" href="/StudentInfo/AdminHandler/managecou/${page_Num }">${page_Num }</a>
                                                        </li>
                                                    </c:if>

                                                </c:forEach>
<%--                                                <c:if test="${pageInfo.hasNextPage }">--%>
<%--                                                    <li><a href="/StudentInfo/AdminHandler/managecou/${pageInfo.pageNum+1 }"--%>
<%--                                                           aria-label="Next"> <span aria-hidden="true">»</span>--%>
<%--                                                    </a></li>--%>
<%--                                                </c:if>--%>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->

                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
<%--        <div class="modal fade" id="modal-lg">--%>
<%--            <div class="modal-dialog modal-lg">--%>
<%--                <div class="modal-content">--%>
<%--                    <div class="modal-header">--%>
<%--                        <h4 class="modal-title">设置评教时间</h4>--%>
<%--                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                            <span aria-hidden="true">&times;</span>--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                    <div class="modal-body">--%>
<%--&lt;%&ndash;                        <div class="form-group">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <label>Date:</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="input-group date" id="reservationdate" data-target-input="nearest">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="text" class="form-control datetimepicker-input" data-target="#reservationdate"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="input-group-append" data-target="#reservationdate" data-toggle="datetimepicker">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </div>&ndash;%&gt;--%>
<%--                        <input type="text" name="daterange" value="01/01/2018 - 01/15/2018" />--%>
<%--                    </div>--%>
<%--                    <div class="modal-footer justify-content-between">--%>
<%--&lt;%&ndash;                        <button type="button" class="btn btn-default" data-dismiss="modal"></button>&ndash;%&gt;--%>
<%--                        <button type="button" class="btn btn-danger">开启评教</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!-- /.modal-content -->--%>
<%--            </div>--%>
<%--            <!-- /.modal-dialog -->--%>
<%--        </div>--%>
    </div>
</div>
</body>
<script type="text/javascript">
    function add(courseclass) {
        const data = { courseclass }
        $.ajax({
            async: false,
            type: "POST",
            url: '/StudentInfo/AjaxHandler/updateCoursePlanComment',
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "text",
            data,
            success: function (data) {
                location.reload()
            },
            error: function (data) {
                console.error(data);
            }
        })
    }
</script>
<%--<script>--%>
<%--    $(function () {--%>
<%--        $('#reservationdate').datetimepicker({--%>
<%--            format: 'L'--%>
<%--        });--%>
<%--    })--%>
<%--</script>--%>
<%--<script>--%>
<%--    $(function() {--%>
<%--        $('input[name="daterange"]').daterangepicker({--%>
<%--            opens: 'left'--%>
<%--        }, function(start, end, label) {--%>
<%--            console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
<jsp:include page="../footer.jsp" />
