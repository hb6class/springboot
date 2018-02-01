<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(function() {
		init();
		$('#myModal form').submit(function(e) {
			e.preventDefault();
			insertOne();
			$('#myModal').modal('hide');
		});
		$(document).on('click','table a',function() {
			var idx=$(this).parent().prev().text();
			console.log("idx:"+idx);
			selectOne(idx);
		});
	});
	
	function insertOne() {
		var data =$('#myModal form').serialize();
		$.post('add',data,function(){
			init();
		});
	}
	
	function selectOne(idx) {
		
	}
	
	function init() {
		var listObj="";
		$.getJSON('http://localhost:8080/sts4x/list',function(data){
			$(data).each(function(num,ele) {
				listObj+='<tr><td>'+ele.idx
							+'</td><td><a href="#" data-toggle="modal" data-target="#detailModal">'
							+ele.sub+'</a></td><td>'+ele.cnt
							+'</td></tr>';
				console.log(num+":"+listObj);
			});
		console.log(listObj);
		$('table>tbody').eq(1).html(listObj);
		});
	}

</script>
</head>
<body>
	<div class="container">
		<h1>GUEST 게시판</h1>
		<table class="table">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>조회수</th>
			</tr>
			<tbody></tbody>
		</table>
		
		<!-- popup -->
		<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">입력페이지</h4>
      </div>
      <div class="modal-body">
        <form>
		  <div class="form-group">
		    <label for="sub">제목</label>
		    <input type="text" name="sub" class="form-control" id="sub" placeholder="제목없음">
		  </div>
		  <div class="form-group">
		    <textarea name="content" rows="" cols=""class="form-control" id="content"></textarea>
		  </div>
		  <div class="form-group">
		    <button type="submit" class="btn btn-default">Submit</button>
		  </div>
		 </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
		<!-- popup end -->
<!-- Modal  data-toggle="modal" data-target="#detailModal"-->
<div id="detailModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">상세페이지</h4>
      </div>
      <div class="modal-body">
      		<p>
      			<span>글번호</span>
      			<span class="detail"></span>
      		</p>
      		<p>
      			<span>제목</span>
      			<span class="detail"></span>
      		</p>
      		<p>
      			<span>내용</span>
      			<span class="detail"></span>
      		</p>
      		<p>
      			<span>조회수</span>
      			<span class="detail"></span>
      		</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
		<!-- popup end -->
		
	</div>
</body>
</html>












