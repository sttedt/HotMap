<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
   integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
   crossorigin="anonymous">
<style>
.col-md-3 {
   display: inline-block;
   margin-left: -4px;
}

.col-md-3 img {
   width: 100%;
   height: auto;
}

body .carousel-indicators li {
   background-color: red;
}

body .carousel-control-prev-icon, body .carousel-control-next-icon {
   background-color: red;
}

body .no-padding {
   padding-left: 0;
   padding-right: 0;
}

.starR {
   background:
      url('http://miuu227.godohosting.com/images/icon/ico_review.png')
      no-repeat right 0;
   background-size: auto 100%;
   width: 30px;
   height: 30px;
   display: inline-block;
   text-indent: -9999px;
   cursor: pointer;
}

.starR.on {
   background-position: 0 0;
}
</style>
<head>
<title>store</title>
</head>
<body>
   <!-- 상단바 -->
   <jsp:include page="topbar2.jsp"></jsp:include>

   <div class="container">
      <div id="demo" class="carousel slide" data-ride="carousel">
         <!-- Indicators -->
         <script>
            var cnt = parseInt('${slide_page_cnt}');
            document.write('<ol class="carousel-indicators" >')
            for (var i = 0; i < cnt; i++) {
               if (i === 0)
                  document
                        .write("<li data-target='#demo' data-slide-to='" + i + "' class='active'></li>")
               else
                  document
                        .write("<li data-target='#demo' data-slide-to='" + i + "'></li>")
            }
            document.write('</ol>')
         </script>
         <!-- The slideshow -->
         <div class="container carousel-inner no-padding">
            <script>
               var cnt = parseInt('${slide_page_cnt}');
               var img_cnt = parseInt('${slide_img_cnt}');
               var imglist = '${imglist}'
               imglist = imglist.replace('[', '').replace(']', '');
               imglist = imglist.split(', ');

               for (var i = 0; i < cnt; i++) {
                  if (i === 0)
                     document.write("<div class='carousel-item active'>")
                  else
                     document.write("<div class='carousel-item'>")

                  for (var j = img_cnt * i; j <= img_cnt * (i + 1) - 1; j++) {
                     if (imglist[j]) {
                        document
                              .write("<div class='col-xs-3 col-sm-3 col-md-3'>")
                        document
                              .write("<img src='http://dndnp4.dothome.co.kr/image/" + imglist[j] +"'style= 'width:280px;height:280px' onclick='imgClick(\"" + imglist[j] +"\")'>")
                        document.write("</div>")
                     }
                  }
                  document.write("</div>")
               }
               function imgClick(imgSrc){
                  $("#modalImg").attr("src","http://dndnp4.dothome.co.kr/image/" + imgSrc)
                  $("#myModal").modal("show")
               }
            </script>
         </div>

         <!-- Left and right controls -->
         <a class="carousel-control-prev" href="#demo" data-slide="prev" style="width:50px"><span class="carousel-control-prev-icon"></span></a>
         <a class="carousel-control-next" href="#demo" data-slide="next" style="width:50px"><span class="carousel-control-next-icon"></span></a>
      </div>
      <!--슬라이드  -->
      <div>
         <br> <span
            style="text-align: left; color: #000000; font-size: 24px;">
            ${detail.name} </span>
         <div style="text-align: right;">
            <a href="review?St_NO=${detail.St_NO}" class="btn btn-dark">리뷰쓰기</a>
         </div>
         <br>
      </div>

      <table class="table">
         <tbody>


            <tr>
               <th>주소</th>
               <td>${detail.address}</td>
            </tr>
            <tr>
               <th>가게번호</th>
               <td>${detail.phone}</td>
            </tr>

            <tr>
               <th>가게종류</th>
               <td>${detail.storetype}</td>
            </tr>
            <tr>
               <th>메뉴</th>
               <td>${detail.menu}</td>
            </tr>
            <tr>
               <th>가격대</th>
               <td>${detail.price}</td>
            </tr>
            <tr>
               <th>평점</th>
               <td><script>
                  var starpoint = parseInt('${detail.star}')
                  for (var i = 0; i < starpoint; i++) {
                     document.write("<span class='starR on'></span>")
                  }
                  for (var i = 0; i < 5 - starpoint; i++) {
                     document.write("<span class='starR'></span>")
                  }
               </script> <span style="font-size: 20pt"> ${detail.starAvg} </span></td>
            </tr>
            <tr>
               <th>태그</th>
               <td id="tag"><script>
                  var taglist = '${detail.tag}';
                  var tagOne = taglist.split(',');
                  for ( var i in tagOne) {
                     if(i == 0 ) {
                        document.write('<a href="search?search='
                              + encodeURIComponent(tagOne[i])
                              + '" name="search">' + tagOne[i] 
                              + '</a>');
                     }
                     else {document.write('<a href="search?search='
                           + encodeURIComponent(tagOne[i])
                           + '" name="search">' + ', ' + tagOne[i] 
                           + '</a>');
                     }
                  }
               </script></td>
            </tr>
            <tr>
               <th>오픈시간</th>
               <td>${detail.opening_time}</td>
            </tr>
            <tr>
               <th>마감시간</th>
               <td>${detail.closing_time}</td>
            </tr>
            <tr>
               <th>조회수</th>
               <td>${detail.hit}</td>
            </tr>

            <tr>
               <th>최근업데이트</th>
               <td>${detail.date}</td>
            </tr>

         </tbody>
      </table>

      <p style="margin-top: -12px">
         <em class="link"> <a href="javascript:void(0);"
            onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
               혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요. </a>
         </em>
      </p>
      <div id="map" style="width: 100%; height: 350px;"></div>


      <div style="text-align: center;">
         <a href="home" class="btn btn-dark">목록</a>
      </div>
   </div>

   <jsp:include page="reviewr.jsp"></jsp:include>

   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc4f5231caf385cfb7e50444395c5b09&libraries=services"></script>
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
         level : 3
      // 지도의 확대 레벨
      };

      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption);

      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();

      // 주소로 좌표를 검색합니다
      geocoder
            .addressSearch(
                  '${detail.address}',
                  function(result, status) {

                     // 정상적으로 검색이 완료됐으면 
                     if (status === kakao.maps.services.Status.OK) {

                        var coords = new kakao.maps.LatLng(result[0].y,
                              result[0].x);

                        // 결과값으로 받은 위치를 마커로 표시합니다
                        var marker = new kakao.maps.Marker({
                           map : map,
                           position : coords
                        });

                        // 인포윈도우로 장소에 대한 설명을 표시합니다
                        var infowindow = new kakao.maps.InfoWindow(
                              {
                                 content : '<div style="width:150px;text-align:center;padding:6px 0;" ><span>${detail.name}</span></div>'
                              });
                        infowindow.open(map, marker);

                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        map.setCenter(coords);
                     }
                  });
   </script>
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
               aria-labelledby="myModalLabel" aria-hidden="true" style="top:120px">
               <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                           aria-hidden="true">&times;</button>
                         <!-- <h4 class="modal-title" id="myModalLabel">Modal title</h4> -->
                     </div>
                     <div class="modal-body">
                     <img id="modalImg" style="width:100%;">
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                           data-dismiss="modal">Close</button>
                        <!-- <button type="button" class="btn btn-primary">Save
                           changes</button> -->
                     </div>
                  </div>

               </div>

            </div>
</body>

