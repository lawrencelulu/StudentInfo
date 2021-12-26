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
<jsp:include page="./studentLeft.jsp" />
<div class="content-wrapper" style="padding-top: 20px;">
    <!-- Main content -->
    <section class="content col-md-8" style="margin: 0 auto;">

        <div class="card">
            <div class="card-header">
                <h3 class="card-title">课程评教</h3>
            </div>
            <!-- /.card-header -->
            <form action="/StudentInfo/StudentHandler/updateSurvey/${courseclass}/${sid}" method="post" name="form1">
            <table class="table">
                <thead>
                <tr>
                    <th>/</th>
                    <th>信息</th>
                </tr>
                </thead>
                <tr>
                    <td>教学班班</td>
                    <td>${courseclass }</td>
                </tr>
                <tr>
                    <td>课程</td>
                    <td>${cname}</td>
                </tr>

                <tr>
                    <td>任课老师</td>
                    <td>${tname }</td>
                </tr>

                <tr>
                    <td>课程评价</td>
<%--                    <td>${requestScope.sage }</td>--%>
                    <td>
                        <textarea class="form-control" rows="5" placeholder="填写点东西吧..." name="feedback"></textarea>
                    </td>
                </tr>

            </table>
                <div class="card-footer">
                    <input type="submit" class="btn btn-danger float-right" value="添加" />
                </div>
            </form>
        </div>
    </section>
</div>
<script>
    $(function () {
        $('.select2').select2()
    })
</script>
</div>
</body>
<jsp:include page="../footer.jsp" />
