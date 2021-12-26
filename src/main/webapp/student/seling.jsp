<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<jsp:include page="studentLeft.jsp" />

	<div class="content-wrapper" style="padding-top: 20px;">
		<div class="content col-md-8" style="margin: 0 auto;">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">确认选课</h3>
				</div>
				<div class="card-body">
					<h5>教学班</h5>
					<p>${courseplan.courseclass}</p>
					<h5>课程名</h5>
					<p>${courseplan.cname}</p>
					<c:if test="${courseplan.precourse != ''}">
						<h5>先修课</h5>
						<p>
							<c:forEach var="precourse" items="${courseplan.precourseList}">
								<span>${precourse.cpname}</span>
							</c:forEach>
						</p>
					</c:if>
					<h5>代课教师</h5>

					<p>${courseplan.tname}</p>
					<div>
						<form action="/StudentInfo/StudentHandler/seling" method="get">

							<c:forEach var="precourse" items="${courseplan.precourseList}">
								<input type="hidden" name="precourse" value="${precourse.cpid }" />
							</c:forEach>
							<input type="hidden" name="precourseName" value="${courseplan.precourseName }" />
							<input type="hidden" name="cid" value="${courseplan.cid }" />
							<input type="hidden" name="sid" value="${sid }" />
							<input type="hidden" name="courseclass" value="${courseplan.courseclass}" />
							<input type="submit" class="btn btn-danger" value="确定选课" />

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../footer.jsp" />