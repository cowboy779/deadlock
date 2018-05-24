<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ include file="/ssi/ssi.jsp" %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BBS List</title>
  <meta content="IE=edge" http-equiv="X-UA-Compatible">
  <meta content="width=device-width,initial-scale=1" name="viewport">
  <meta content="description" name="description">
  <meta name="google" content="notranslate" />
  <meta content="Mashup templates have been developped by Orson.io team" name="author">

<link rel="stylesheet" type="text/css" href="${root }/univers/main.3f6952e4.css">
</head>
<body>

<div id="site-border-left"></div>
<div id="site-border-right"></div>
<div id="site-border-top"></div>
<div id="site-border-bottom"></div>

<div class="section-container">
  <div class="container">
    <div class="row">
      
      <div class="col-sm-8 col-sm-offset-2 section-container-spacer">
        <div class="text-center">
          <h1 class="h2">02 : BoardList</h1>
          <p>Nulla facilisi. Vivamus vestibulum, elit in scelerisque ultricies, nisl nunc pulvinar ligula, id sodales arcu sapien in nisi. Quisque libero enim, mattis non augue posuere, venenatis dapibus urna.</p>
        </div>
      </div>

      <div class="col-md-12">
     
      <div id="myCarousel" class="carousel slide projects-carousel">
        <!-- Carousel items -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="row">
                    <div class="col-sm-4">

                      <a href="${root }/rbbs/list" title="" class="black-image-project-hover">
                        <img src="${root }/univers/images/work01-hover.jpg" alt="" class="img-responsive">
                      </a>
                      <div class="card-container card-container-lg">
                        <h4>001/006</h4>
                        <h3>RBBS 입니당</h3>
                        <p>건의하기 합시당</p>
                        <a href="${root }/rbbs/list" title="" class="btn btn-default">Discover</a>
                      </div>
                    </div>
                    <div class="col-sm-4">
                      <a href="${root }/nbbs/list" title="" class="black-image-project-hover">
                        <img src="${root }/univers/images/work02-hover.jpg" alt="" class="img-responsive">
                      </a>
                      <div class="card-container card-container-lg">
                        <h4>002/006</h4>
                        <h3>공지사항</h3>
                        <p>자세한 내용을 보시려면 클릭하세요</p>
                        <a href="${root }/nbbs/list" title="" class="btn btn-default">Discover</a>
                      </div>
                    </div>
                    <div class="col-sm-4">
                      <a href="${root }/qbbs/list" title="" class="black-image-project-hover">
                        <img src="${root }/univers/images/work03-hover.jpg" alt="" class="img-responsive">
                      </a>
                      <div class="card-container card-container-lg">
                        <h4>003/006</h4>
                        <h3>QnA</h3>
                        <p>Do you get more infomation? come here!</p>
                        <a href="${root }/qbbs/list" title="" class="btn btn-default">Discover</a>
                      </div>
                    </div>
                    
                </div>
                <!--/row-->
            </div>
            <!--/item-->
            <div class="item">
                <div class="row">
                  <div class="col-sm-4">
                    <a href="${root }/cbbs/list" class="black-image-project-hover">
                      <img src="${root }/univers/images/work02-hover.jpg" alt="Image" class="img-responsive">
                    </a>
                    <div class="card-container">
                      <h4>004/006</h4>
                      <h3>Cbbs</h3>
                      <p>추천 사이트</p>
                      <a href="${root }/cbbs/list" class="btn btn-default">Discover</a>
                    </div>
                  </div>
                   <div class="col-sm-4">
                      <a href="${root }/ybbs/list" class="black-image-project-hover">
                        <img src="${root }/univers/images/work01-hover.jpg" alt="Image" class="img-responsive">
                      </a>
                      <div class="card-container">
                        <h4>005/006</h4>
                        <h3>ybbs</h3>
                        <p>방명록.</p>
                        <a href="${root }/ybbs/list" class="btn btn-default">Discover</a>
                      </div>
                    </div>
                    
                    <div class="col-sm-4">
                      <a href="${root }/pbbs/list" class="black-image-project-hover">
                        <img src="${root }/univers/images/work03-hover.jpg" alt="Image" class="img-responsive">
                      </a>
                      <div class="card-container">
                        <h4>006/006</h4>
                        <h3>pbbs?</h3>
                        <p>여기로 오셈 pbbs 모여라!</p>
                        <a href="${root }/pbbs/list" class="btn btn-default">Discover</a>
                      </div>
                    </div>
                    
                </div>
                <!--/row-->
            </div>
            
            <!--/item-->
        </div>
        <!--/carousel-inner--> 
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>

        <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
     </div>



    <!--/myCarousel-->
    </div>



    </div>
  </div>
</div>







<!-- -------------------------script--------------------------------- -->
<script>
  document.addEventListener("DOMContentLoaded", function (event) {
     navActivePage();
  });
</script>

<script type="text/javascript" src="${root }/univers/main.70a66962.js"></script>
</body>
</html>