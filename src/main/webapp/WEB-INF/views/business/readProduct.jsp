<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>
      <section class="auctionn_wrap">
         <div class="auctionn_img">
            <div class="auctionn_imgs">
               <%@include file="./include/attachFileManagement.jsp"%>
            </div>
         </div>
               <div class="autionn_content">
                      <h2 class = "autionn_title">${post.title}</h2>
                      <h3 class = "autionn_price">
                         <c:choose>
                          <c:when test="${negoBuyer.discountPrice eq 0}"> 

                              <script>
                                   $(document).ready(function() {
                                   getConvertWons(${product.productPrice}, '.autionn_price');
                                 });
                           </script>
                          </c:when>
                          
                          <c:when test="${negoBuyer.auctionCurrentPrice ne 0}"> 
                             <script>
                                   $(document).ready(function() {
                                   getConvertWons(${product.productPrice}, '.autionn_price');
                                 });
                           </script>                           
                          </c:when>                          
                          <c:otherwise> 
                          
                             <script>
                                   $(document).ready(function() {
                                   getConvertWons(${negoBuyer.discountPrice}, '.autionn_price');
                                  });
                           </script>
                             
                               
                          </c:otherwise>
                      </c:choose>   
                      </h3>
                      <div class = "autionn_detail">
                          <span>????????????<br>
                          ${post.content}</span>
                      </div>   
                   
                   <div class="registration_date">
                       <span>?????????</span>
                       <span>2021-08-09</span>
                   </div>                                     
                   <div class="aution_time_remaining">
                       <span id="auctionTimer"></span>
                    </div>    
                   
                  <div class="auctionn_button">
                      <button type="button" data-oper='list'>
                          <span>??????</span>
                          <i class="fas fa-comment-dots"></i>
                      </button>
                      <sec:authentication property="principal" var ="customUser"/>
                      <sec:authorize access="isAuthenticated()">
                     <c:if test="${customUser.curUser.userId ne post.writer.userId}">
                        <button data-oper='chat' class="autionn_chat">
                           <span>????????????</span>
                           <i class="fas fa-comment-dots"></i>
                        </button>
                        <c:if test="${child ne 7}">
                           <button data-oper='nego' class="product_chat">
                              <span>????????????</span>
                           </button>
                        </c:if>
                        <button id='cart' class="product_like">
                           <span>???????????? ??????</span>
                           <i class="fas fa-heart"></i>
                           
                        </button>
                        <c:if test="${child != 7}">
                        <button id='payment' class="btn btn-secondary">
                           <span>????????????</span>
                        </button>
                        </c:if>
                        
                        <button id='autionpayment' class="btn btn-secondary">
                           <span>????????????</span>
                        </button>
                        
                        <c:if test="${child == 7}">
                           <button id="btnAuction" type="button" class="product_chat">
                              <span>????????????</span>
                           </button>
                        </c:if>
                     </c:if>
                     <sec:authentication property="principal" var="customUser" />
                     <c:if test="${customUser.curUser.userId eq post.writer.userId}">
                        <button data-oper='modify' class="product_chat">
                           <span>??????</span>
                        </button>
                     </c:if>   
                     </div>   
                  </sec:authorize>
                  <c:if test="${child == 7}">                  
                  <div class = "best_auction_price">
                         <h5>???????????????</h5> 
                         <button type="button" class="autionn_list">
                             <span>?????????</span>
                         </button>
                         <div class = "best_auction_list">
                             <span>${maxBidPrice.buyerId}</span>
                             <span>${maxBidPrice.auctionCurrentPrice}</span>
                         </div>
                     </div>
                     
                     <div class="bid_amount_graph_box">
                         <h5>?????? ?????????</h5>                        
                         <canvas id="lookChartProduct" class="bid_amount_graph"></canvas>                         
                     </div>                                                
                  </c:if>
                  </div>
            
      </section>

      <div class="auction_modal_wrapper"> 
           <div class="auction_modal">
               <div class="auctionn_top">
                   <h5>?????????</h5>
                   <div class="auctionn_close">
                       <i class="fas fa-times"></i>
                   </div>
               </div>
               <div class="auction_divider"></div>
               <ul>
                  <c:forEach items="${auctionParty}" var="party">
                      <li>
                          <span>${party.buyerId}</span>
                          <span>${party.auctionCurrentPrice}</span>
                      </li>
                   </c:forEach>
               </ul>
           </div>
       </div>
      
         <form id="frmChat" action="/chat/chatting" method="get">
            <input type="hidden" id="toId" name="toId"
               value="${post.writer.userId}">
         </form>

         <form id='frmOper' action="/post/modifyPost" method="get">
            <input type="hidden" name="boardId" value="${boardId}"> 
            <input type="hidden" name="child" value="${child}"> 
            <input type="hidden" id="postId" name="postId" value="${post.id}">
         </form>

         <form id='frmCart' action="/post/insertShoppingCart" method="post">
            <input type="hidden" id="productId" name="productId"
               value="${post.id}"> <input type="hidden" name="boardId"
               value="${boardId}"> <input type="hidden" name="child"
               value="${child}"> <input type='hidden'
               name='${_csrf.parameterName}' value='${_csrf.token}'>
         </form>
         
            <form id="frmPayment" action="/business/payment" method="get">
               <input type="hidden" name="boardId" value="${boardId}">
               <input type="hidden" name="child" value="${child}">
               <input type="hidden" name="productId" value="${post.id}"> 
            </form>   
            
            <form id="frmAutionpayment" action="/business/autionPayment" method="get">
               <input type="hidden" name="boardId" value="${boardId}">
               <input type="hidden" name="child" value="${child}">
               <input type="hidden" name="productId" value="${post.id}"> 
            </form>   
            

      <div id="modalProductNego" class="modal fade" tabindex="-1"
         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header" style="text-align: center;">
                  <h4 class="modal-title" id="myModalLabel" align="center"
                     style="margin: 0 auto;">????????? ????????? ???????????????</h4>
               </div>
               <!-- End of modal-header -->
               <div class="modal-body" id="modalProductNegoBody"
                  style="text-align: center;">
                  <label>????????????</label> <input class="form-control" name='negoPrice'
                     id="negoPrice" value=''>
               </div>
               <div class="modal-footer">
                  <button id='btnSubmitNego' type="button" class="btn btn-default"
                     onclick="negoSubmitFunction();">??????</button>
                  <button id='btnCloseModal' type="button" class="btn btn-default">??????</button>
               </div>
            </div>
         </div>
      </div>

      <!-- ?????? ?????? ?????? ?????? -->
      <div id="AuctionModal" class="modal fade" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header" style="text-align: center;">
                  <h4 class="modal-title" id="auctuionModalLabel" align="center"
                     style="margin: 0 auto;">?????? ????????? ??????????????????.</h4>
               </div>
               <!-- End of modal-header -->
               <form id="frmAuction" action="/business/readProduct" method="post">
                  <div class="modal-body" id="modalAuctionBody"
                     style="text-align: center;">
                     <input class="form-control" type="hidden" name='buyerId' id="buyerId" value='${userId}'> 
                     <label>????????????</label> 
                     <input class="form-control" name='auctionCurrentPrice' id="auctionCurrentPrice">
                  </div>
                  <div class="modal-footer">

                     <button id='btnPriceModal' type="button" class="btn btn-primary">??????</button>
                     <button id='btnCloseModal' type="button" class="btn btn-default">??????</button>
                     <input type="hidden" id="sellerId" name="sellerId"
                        value="${post.writer.userId}"> <input type="hidden"
                        name="boardId" value="${boardId}"> <input type="hidden"
                        name="child" value="${child}"> <input type="hidden"
                        id="postId" name="postId" value="${post.id}"> <input
                        type='hidden' name='${_csrf.parameterName}'
                        value='${_csrf.token}'>
                  </div>
               </form>
            </div>
         </div>
      </div>

      <div id="modalShopCart" class="modal fade" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header" style="text-align: center;">
                  <h4 class="modal-title" id="myModalLabel" align="center"
                     style="margin: 0 auto;">?????? ????????? ??????????????? ???????????????</h4>
               </div>
               <!-- End of modal-header -->
               <div class="modal-body" id="modalProductNegoBody"
                  style="text-align: center;">
                  <label>????????????</label> <input class="form-control" name='negoPrice'
                     id="negoPrice" value=''>
               </div>
               <div class="modal-footer">
                  <button id='btnSubmitNego' type="button" class="btn btn-default"
                     onclick="negoSubmitFunction();">??????</button>
                  <button id='btnCloseModal' type="button" class="btn btn-default">??????</button>
               </div>
            </div>
         </div>
      </div>


<!-- /.container-fluid -->

<!-- End of Main Content -->
<%@include file="../includes/footer.jsp"%>
<script src="\resources\js\util\dateFormat.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $('#autionpayment').hide();
      showPurchaseWhenAutionEnd();
      if ("${child}" == "7") {
         makeChart();
      }
         adjustCRUDAtAttach('??????');
         negoSubmitFunction();
         <c:forEach var="attachVoInStr" items="${post.attachListInGson}" >      
            appendUploadUl('<c:out value="${attachVoInStr}" />');
         </c:forEach>
         // ?????? ?????? ????????? ?????? ?????????
         $("#btnAuction").on("click", function(e) {
            $("#AuctionModal").modal("show");
         });
         // ?????? ????????? ?????? ?????? ???????????? ??? ?????? ??????????????? ?????? ??????.
         $("#btnPriceModal").on("click", function(e) {
            var a = $("#auctionCurrentPrice").val()
            if (parseInt("${maxBidPrice.auctionCurrentPrice}") > parseInt($("#auctionCurrentPrice").val()) 
                  || parseInt("${product.productPrice}") > parseInt($("#auctionCurrentPrice").val())
                  || $("#auctionCurrentPrice").val() == '') {
               alert("????????? ?????????????????????.")
            } else {
               alert("????????? ?????????????????????.");
               $("#frmAuction").submit();
               return;
            }
            $("#AuctionModal").modal("hide");
         });
         //EL??? ????????? LIST ?????? ??????, ????????? ??????????????? ?????????, El??? Server?????? ?????????
         //postCommon??? ?????? ????????? ?????? ???
         $("button[data-oper='modify']").on("click", function() {
            $("#frmOper").submit();
         });
         $("button[data-oper='list']").on( "click", function() {
            $("#frmOper").find("#postId").remove();
            $("#frmOper").attr("action","/business/productList").submit();
         });
         //???????????? ????????? ??????
           $("#payment").on("click", function() {
                $("#frmPayment").attr("action", "/business/payment");
                frmPayment.submit();
           });
         
         //?????? ?????? ???????????? ??????
           $("#autionpayment").on("click", function() {
                $("#frmAutionpayment").attr("action", "/business/autionPayment");
                $("#frmAutionpayment").submit();
           });
           
         
         $("button[data-oper='chat']").on("click", function() {
            window.open("../chat/chatting?toId=${post.writer.userId}", "_blank", "width=400,height=500,left=1200,top=10");
         });
         //???????????? ??????
         $("#cart").on("click", function() {
            if ("${checkShoppingCart}" == "0") {
               $("#frmCart").attr("action","/business/insertShoppingCart");
               $("#frmCart").submit();
               alert('????????? ??????????????? ???????????????')
            } else {
               alert('?????? ????????? ??????????????????')
               return;
            }
         });
         //???????????? ????????? ???????????? ????????? ????????????.      
         $("button[data-oper='nego']").on("click", function() {
            $("#modalProductNego").modal("show");
         });
         $("#btnSubmitNego").on("click", function(e) {
            $("#modalProductNego").modal("hide");
         });
         //???????????? ?????? ????????? ????????? ??????
         $("#btnCloseModal").on("click", function(e) {
            $("#modalProductNego").modal("hide");
         });
         

         
         
//          var productPrice = "${product.productPrice}";         
//          var negoPrice = "${negoBuyer.discountPrice}"; 
//          var auctionPrice = "${negoBuyer.auctionCurrentPrice}";   
//          var pp = productPrice.toLocaleString("ko-KR", { style: 'currency', currency: 'KRW'});
         
//          if (negoPrice == 0 || negoPrice == '' || negoPrice == null){
//          $('.autionn_price').html(pp+'???');
            
//          } else if (auctionPrice != ''){
//             $('.autionn_price').html(pp+'???');
            
//          }else{
//             var ppp = negoPrice.toLocaleString("ko-KR", { style: 'currency', currency: 'KRW'});
//             $('.autionn_price').html(ppp+'???');
//          }

      });
   //?????? ?????? ???????????? ????????? ??????.
   function negoSubmitFunction() {
      var fromID = "${userId}";
      var toID = "${post.writer.userId}";
      var chatContent = $('#negoPrice').val();
      var boardId = "${boardId}";
      var child = "${child}";
      var productId = document.getElementById("postId").value;
      if (chatContent != "") {
         chatContent += "?????? ??????! <br>????????? ??????????????? ??????????????? <br>";
         chatContent += "<a href='/business/readProduct?boardId=" + boardId +"&child=" + child + "&productId=" + productId + "' target='_blank'>??? ?????? ????????????</a>";
         chatContent += "<div  style='float:left;' ><button type='button' id='negoAgree' style='width:80px; margin-right: 20px; margin-left: 15px; background-color: #E0F8F1' onclick='updateProductPrice("
               + $('#negoPrice').val() + ");'>??????</button>";
         chatContent += "<button type='button' id='negoDisAgree' style='width:80px; background-color: #F6CEEC'' onclick='disAgree();'>??????</button></div>"
         chatContent += "<input type='hidden' id='postId' value='${post.id}'/>";
      }
      var header = $("meta[name='_csrf_header']").attr("content");
      var token = $("meta[name='_csrf']").attr("content");
      var csrfHN = "${_csrf.headerName}";
      var csrfTV = "${_csrf.token}";
      $.ajax({
         type : "POST",
         url : "/chat/chatting",
         data : {
            fromID : fromID,
            toID : toID,
            chatContent : chatContent,
         },
         beforeSend : function(xhr) {
            xhr.setRequestHeader(csrfHN, csrfTV);
         },
         success : function(result) {
         }
      });
      // ???????????? ???????????? content??? ?????? ????????????.
      $('#negoPrice').val('');
   }
   function autionBid() {
      var userID = "${userId}";
      var auctionCurrentPrice = $("#auctionCurrentPrice").val();
      var boardId = "${boardId}"
      var child = "${child}"
      var postId = "${post.id}"
      var sellerId = "${post.writer.userId}"
      if (auctionCurrentPrice == null) {
         alert('????????? ????????? ?????????');
         return;
      }
      $.ajax({
         type : "GET",
         url : "/business/readProduct",
         data : {
            userID : userID,
            auctionCurrentPrice : auctionCurrentPrice,
            boardId : boardId,
            child : child,
            postId : postId,
            sellerId : sellerId
         },
         beforeSend : function(xhr) {
            xhr.setRequestHeader(csrfHN, csrfTV);
         },
         success : function(result) {
         }
      });
      // ???????????? ???????????? content??? ?????? ????????????.
      $("#auctionCurrentPrice").val();
   }
   
   function showPurchaseWhenAutionEnd() {
   
   }
</script>

<!-- ?????? ????????? ?????? -->
<script>
if("${child}" == "7"){
   const countDownTimer = function(id, date) {
      var _vDate = new Date(date); // ?????? ?????? ??????
      var _second = 1000;
      var _minute = _second * 60;
      var _hour = _minute * 60;
      var _day = _hour * 24;
      var timer;
      function showRemaining() {
         var now = new Date();
         var distDt = _vDate - now;
         if (distDt < 0) {
            clearInterval(timer);
            document.getElementById(id).textContent = '?????? ????????? ?????? ???????????????!';
            $('#btnAuction').hide();
            if("${child}" == "7" && "${maxBidPrice.buyerId}" == "${userId}")
            $('#autionpayment').show();
            return;
         }
         var days = Math.floor(distDt / _day);
         var hours = Math.floor((distDt % _day) / _hour);
         var minutes = Math.floor((distDt % _hour) / _minute);
         var seconds = Math.floor((distDt % _minute) / _second);
         document.getElementById(id).textContent = days + '??? ';
         document.getElementById(id).textContent += hours + '?????? ';
         document.getElementById(id).textContent += minutes + '??? ';
         document.getElementById(id).textContent += seconds + '???';
      }
      timer = setInterval(showRemaining, 100);
   }
   var dateObj = new Date();
   dateObj.setDate(dateObj.getDate() + 1);
   countDownTimer('auctionTimer', '${condition.auctionEndDate}'); // 2024??? 4??? 1?????????, ????????? ??????????????? 01:00 AM??? ?????? ????????? ????????????.
}
</script>

<!--DB??? Chart ?????? ???????????? ????????? ?????????????????? ?????????, ??????????????? Update ??????  -->
<script>
   function makeChart() {
      var ctx = document.getElementById("lookChartProduct");
      var buyer = new Array();
      var price = new Array();
      <c:forEach items="${tc}" var="item" varStatus="status">
      buyer.push("${item.buyerId}");
      price.push("${item.auctionCurrentPrice}");
      </c:forEach>
      
      var chart = new Chart(ctx, {
         type : 'line',
         data : {
            labels : buyer,
            datasets : [ {
               label : "?????? ??????",
               borderColor : 'rgb(204, 102, 255)',
               data : price
            } ]   
         },
         options : {
            responsive : false,
            scales : {
               yAxes : [ {
                  ticks : {
                     beginAtZero : true
                  }
               } ]
            }
         }
      });
   }
   
const auctionList = document.querySelector('.autionn_list');
const modal = document.querySelector('.auction_modal_wrapper');
const modalClose = document.querySelector('.fa-times');


auctionList.addEventListener("click", ()=>{
    modal.style.display = "flex"
    document.body.style.overflow= 'hidden';
})

modalClose.addEventListener("click", () => {
    modal.style.display = "none"
    document.body.style.overflow= 'scroll';
})

window.addEventListener("keyup", (e) => {
    if(modal.style.display === "flex" && e.key === "Escape"){
        modal.style.display = "none"
        document.body.style.overflow= 'scroll';
    }
})

   function getConvertWons(price, state){
      dateFormatService.getConvertWon(price, state);
   }
</script>