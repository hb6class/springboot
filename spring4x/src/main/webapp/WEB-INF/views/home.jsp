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
		var show=true;
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
		
		$('#detailModal .modal-footer>button').eq(0).click(function() {
			if(show){
				$('#detailModal input').attr('type','text');
				$('.detail').hide();
			}else{
				$('#detailModal input').attr('type','hidden');
				$('.detail').show();
				editOne();
			}
			show=!show;
		});
		$('#detailModal .modal-footer>button').eq(1).click(function() {
			console.log("delete:"+$('.detail').eq(0).text());
			var idx=$('.detail').eq(0).text();
			deleteOne(idx);
			init();
			$('#detailModal').modal('hide');
		});
	});
	
	function editOne() {
		var sub=$('#detailModal input').eq(1).val();
		var content=$('#detailModal input').eq(2).val();
		var param=JSON.stringify({
			'sub':sub,
			'content':content
		});
		$.ajax({
			headers:{
				'Accept':'application/json',
				'Content-Type':'application/json'
			},
			type:'put',
			url:'http://localhost:8080/sts4x/'+$('.detail').eq(0).text(),
			data:param,
			dataType:'text',
			success:function(){
				init();
				$('#detailModal').modal('hide');
			}
		});
	}
	
	function deleteOne(idx) {
		$.ajax({
			type:'delete',
			url:'http://localhost:8080/sts4x/'+idx,
			success:function(){
				console.log('delete ok');
				
			}
		});
	}
	
	function insertOne() {
		var data =$('#myModal form').serialize();
		$.post('add',data,function(){
			init();
		});
	}
	
	function selectOne(idx) {
		$.getJSON('http://localhost:8080/sts4x/'+idx,
						function(data){
			$('.detail').eq(0).text(data.idx);
			$('#detailModal input').eq(0).val(data.idx);
			$('.detail').eq(1).text(data.sub);
			$('#detailModal input').eq(1).val(data.sub);
			$('.detail').eq(2).text(data.content);
			$('#detailModal input').eq(2).val(data.content);
			$('.detail').eq(3).text(data.cnt);
			$('#detailModal input').eq(3).val(data.cnt);
		});
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
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">글쓰기</button>

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
      			<label for="idx">글번호</label>
      			<span class="detail"></span>
      			<input type="hidden" id="idx" readonly="readonly">
      		</p>
      		<p>
      			<label for="sub">제목</label>
      			<span class="detail"></span>
      			<input type="hidden" id="sub">
      		</p>
      		<p>
      			<label for="content">내용</label>
      			<span class="detail"></span>
      			<input type="hidden" id="content">
      		</p>
      		<p>
      			<label for="cnt">조회수</label>
      			<span class="detail"></span>
      			<input type="hidden" id="cnt">
      		</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" >수정</button>
        <button type="button" class="btn btn-default" >삭제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
		<!-- popup end -->
		
	</div>
</body>
</html>












