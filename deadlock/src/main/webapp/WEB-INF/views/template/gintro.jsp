<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">

<title>Slider Pro</title>

<link rel="stylesheet" type="text/css" href="${root }/univers/css/slider-pro.min.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="${root }/univers/css/examples.css" media="screen"/>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600' rel='stylesheet' type='text/css'>

<script type="text/javascript" src="${root }/univers/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${root }/univers/jquery.sliderPro.min.js"></script>

<script type="text/javascript">
	$( document ).ready(function( $ ) {
		$( '#example1' ).sliderPro({
			width: 960,
			height: 500,
			arrows: true,
			buttons: false,
			waitForLayers: true,
			thumbnailWidth: 200,
			thumbnailHeight: 100,
			thumbnailPointer: true,
			autoplay: false,
			autoScaleLayers: false,
			breakpoints: {
				500: {
					thumbnailWidth: 120,
					thumbnailHeight: 50
				}
			}
		});
	});
</script>
<script type="text/javascript">
function lnsi_game(){
	var url="${root}/game/lnsi_game/start";
		
		var wr = window.open(url,"game","width=1200, height=1000, resizable=no");
		wr.moveTo(((window.screen.width-1200)/2),((window.screen.height-1000)/2));
	}
function yb_game(){
	var url="${root}/game/yb_game/game";
	
	var wr = window.open(url,"game","width=1200, height=1000, resizable=no");
	wr.moveTo(((window.screen.width-1200)/2),((window.screen.height-1000)/2));
}
function oh_game(){
	var url="${root}/game/oh_game/ex1";
	
	var wr = window.open(url,"game","width=1200, height=1000, resizable=no");
	wr.moveTo(((window.screen.width-1200)/2),((window.screen.height-1000)/2));
}
function ash_game(){
	var url="${root}/game/ash_game/doremiGame";
	
	var wr = window.open(url,"game","width=1200, height=1000, resizable=no");
	wr.moveTo(((window.screen.width-1200)/2),((window.screen.height-1000)/2));
}
function han_game(){
	var url="${root}/game/han_game/m_Psychological_testing";
	
	var wr = window.open(url,"game","width=1200, height=1000, resizable=no");
	wr.moveTo(((window.screen.width-1200)/2),((window.screen.height-1000)/2));
}
function survey(){
	var url="${root}/survey/create";
	var wr = window.open(url,"survey","width=1200, height=1000, resizable=no");
	wr.moveTo(((window.screen.width-1200)/2),((window.screen.height-1000)/2));
}
</script>

</head>

<body>

	<div id="example1" class="slider-pro">
		<div class="sp-slides">
			<!--***************************** 이나슬이 -->
			<div class="sp-slide">
				<a href="javascript:lnsi_game()">
				<img class="sp-image" src="${root }/univers/img/blank.gif"
					data-src="${root }/univers/img/seulbaimg.jpg"
					data-retina="${root }/univers/img/seulbaimg.jpg"/>
				</a>
				<p class="sp-layer sp-white sp-padding"
					data-horizontal="50" data-vertical="50"
					data-show-transition="left" data-hide-transition="up" data-show-delay="400" data-hide-delay="200">
					#Scared
				</p>

				<p class="sp-layer sp-black sp-padding hide-small-screen"
					data-horizontal="180" data-vertical="50"
					data-show-transition="left" data-hide-transition="up" data-show-delay="600" data-hide-delay="100">
					#Message
				</p>

				<p class="sp-layer sp-white sp-padding hide-medium-screen"
					data-horizontal="315" data-vertical="50"
					data-show-transition="left" data-hide-transition="up" data-show-delay="800">
					Made by Lee
				</p>
			</div>
			<!--***************************** 이나슬이 -->
			
			<!-- ***************************박영부 -->
	        <div class="sp-slide">
	        	<a href="javascript:yb_game()">
		        	<img class="sp-image" src="${root }/univers/img/blank.gif"
		        		data-src="${root }/univers/img/ybbaimg.jpg"
		        		data-retina="${root }/univers/img/ybbaimg.jpg"/>
	        	</a>

				<h3 class="sp-layer sp-black sp-padding" 
					data-horizontal="40" data-vertical="10%" 
					data-show-transition="left" data-hide-transition="left">
					#Soldesk
				</h3>

				<p class="sp-layer sp-white sp-padding hide-medium-screen" 
					data-horizontal="40" data-vertical="22%" 
					data-show-transition="left" data-show-delay="200" data-hide-transition="left" data-hide-delay="200">
					#Horror
				</p>

				<p class="sp-layer sp-black sp-padding hide-small-screen" 
					data-horizontal="40" data-vertical="34%"
					data-show-transition="left" data-show-delay="400" data-hide-transition="left" data-hide-delay="500">
					Made by Park
				</p>
			</div>
			<!-- ***************************박영부 -->
			
			
			<!-- ***************************오정훈 -->
			<div class="sp-slide">
				<a href="javascript:oh_game()">
					<img class="sp-image" src="${root }/univers/img/blank.gif"
					data-src="${root }/univers/img/jhbaimg.jpg"
					data-retina="${root }/univers/img/jhbaimg.jpg"/>
				</a>

				<p class="sp-layer sp-white sp-padding" 
					data-position="centerCenter" data-vertical="-50" 
					data-show-transition="right" data-hide-transition="left" data-show-delay="500" >
					#NaDoRi
				</p>

				<p class="sp-layer sp-black sp-padding hide-small-screen" 
					data-position="centerCenter" data-vertical="50" 
					data-show-transition="left" data-show-delay="700" data-hide-transition="right" data-hide-delay="200">
					#7:36
				</p>
			</div>
			<!-- ***************************오정훈 -->
			
			<!-- ***************************안서현 -->
			<div class="sp-slide">
				<a href="javascript:ash_game()">
					<img class="sp-image" src="${root }/univers/img/blank.gif"
						data-src="${root }/univers/img/shbaimg.jpg"
						data-retina="${root }/univers/img/shbaimg.jpg"/>
				</a>

				<p class="sp-layer sp-black sp-padding" 
					data-position="bottomLeft"
					data-show-transition="up" data-hide-transition="down">
					Can you listen music? <span class="hide-small-screen">Exciting, Interesting, Amazing.</span> <span class="hide-medium-screen">If you know MusicName, you are surprise! Please Try This Music Show!!</span>
				</p>
			</div>
			<!-- ***************************안서현 -->
			
			<!-- ***************************한정환 -->
			<div class="sp-slide">
				<a href="javascript:han_game()">
					<img class="sp-image" src="${root }/univers/img/blank.gif"
						data-src="http://bqworks.com/slider-pro/images/image5_medium.jpg"
						data-retina="http://bqworks.com/slider-pro/images/image5_large.jpg"/>
				</a>

				<p class="sp-layer sp-white sp-padding" 
					data-vertical="10" data-horizontal="2%" data-width="96%" 
					data-show-transition="down" data-show-delay="400" data-hide-transition="up">
					나는 어떤 종류의 <span class="hide-small-screen">사람일까?</span> <span class="hide-medium-screen"> -지금 바로 알아보세요!</span>
				</p>
			</div>
			<!-- ***************************한정환 -->
			
			<!-- ***************************설문조사 -->
			<div class="sp-slide">
				<a href="javascript:survey()">
					<img class="sp-image" src="${root }/univers/img/blank.gif"
						data-src="http://bqworks.com/slider-pro/images/image6_medium.jpg"
						data-retina="http://bqworks.com/slider-pro/images/image6_large.jpg"/>
				</a>
					<p class="sp-layer sp-white sp-padding" 
						data-horizontal="10" data-vertical="10" data-width="35%">
						등업할 수 있는 기회! <span class="hide-small-screen">게임</span> <span class="hide-medium-screen">인기투표!</span>
					</p>
			</div>
			<!-- ***************************설문조사 -->



		</div>
 
		<div class="sp-thumbnails">
			<div class="sp-thumbnail">
				<div class="sp-thumbnail-title">Dyeing Message</div>
				<div class="sp-thumbnail-description">Now Open!</div>
			</div>

			<div class="sp-thumbnail">
				<div class="sp-thumbnail-title">Dark Soldesk</div>
				<div class="sp-thumbnail-description">Now Open!</div>
			</div>

			<div class="sp-thumbnail">
				<div class="sp-thumbnail-title">Finding Dori</div>
				<div class="sp-thumbnail-description">Now Open!</div>
			</div>

			<div class="sp-thumbnail">
				<div class="sp-thumbnail-title">Doremi Sol</div>
				<div class="sp-thumbnail-description">Now Open!</div>
			</div>

			<div class="sp-thumbnail">
				<div class="sp-thumbnail-title">Escape Tower</div>
				<div class="sp-thumbnail-description">Now Open!</div>
			</div>

			<div class="sp-thumbnail">
				<div class="sp-thumbnail-title">SunSet Out</div>
				<div class="sp-thumbnail-description">Now Open!</div>
			</div>



		</div>
    </div>

</body>
</html>