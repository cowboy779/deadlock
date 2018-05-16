<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/ssi/ssi.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>home</title>
 <link rel="stylesheet" type="text/css" href="${root }/univers/main.3f6952e4.css">
</head>
<body>
<div>
  <div class="hero-full-container background-image-container white-text-container" style="background-image: url('${root }/univers/images/space.jpg')">
    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <div class="hero-full-wrapper">
            <div class="text-content">
              <h1>Dear. Dead Lock...,<br>
                <span id="typed-strings">
                  <span>${serverTime}</span>
                  <span></span>
                  <span></span>
                </span>
                <span id="typed"></span>
              </h1>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  document.addEventListener("DOMContentLoaded", function (event) {
     type();
     movingBackgroundImage();
  });
</script>


<script type="text/javascript" src="${root }/univers/main.70a66962.js"></script>
</body>
</html>
