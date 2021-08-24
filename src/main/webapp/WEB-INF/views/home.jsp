<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="includes/header.jsp"%>

<div class="mainCcontainer" >
   <div class="section">
      <div class="slidewrap">
         <ul class="slidelistt" >
            <!-- 슬라이드 영역 -->
            <li class="slideitem">
               <a>
                  <img src="/resources/img/logos/faq.png">
               </a>
            </li>
         </ul>
         	<c:forEach items="${boardList}" var="board">
               <c:if test="${board.id == 2}">
               	<li>
                  <button class="btn-1" onclick="location.href='/post/listBySearch?boardId=${board.id}&child=0'" style="position: absolute; top: 230px; left : 55%;">
                     ${board.name}
                  </button>
                  </li>                                    
               </c:if>
           </c:forEach>
      </div>
   </div>
</div>

<%@include file="includes/footer.jsp"%>