<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/template/header.jsp"%>    
<script type="text/javascript">
$(document).ready(function() {
	 
	$('#zipcode').focusin(function() {
		$('#zipModal').modal();
	});
	
});

function register(){
	if(document.getElementById("name").value == ""){
		alert("이름 입력!");
		return;
	}else if(document.getElementById("id").value == ""){
		alert("아이디 입력!");
		return;
	}else if(document.getElementById("pass").value == ""){
		alert("비밀번호 입력!");
		return;		
	}else if(document.getElementById("pass").value != document.getElementById("passcheck").value){
		alert("비밀번호 확인!")
		return;
	}else{
		document.getElementById("memberform").action="<%= root%>/user/register.jsp";
		document.getElementById("memberform").submit();
	}
}


</script>
</head>
<body>

	<div class="container" align="center">
		<div class="col-lg-6" align="center">
			<h2>회원가입</h2>
			<form id="memberform" method="post" action="">
				<div class="form-group" align="left">
					<label for="name">이름</label> <input type="text"
						class="form-control" id="name" name="name" placeholder="이름입력">
				</div>
				<div class="form-group" align="left">
					<label for="">아이디</label> <input type="text" class="form-control"
						id="id" name="id" placeholder="4자이상 16자 이하">
				</div>
				<div class="form-group" align="left">
					<label for="">비밀번호</label> <input type="password"
						class="form-control" id="pass" name="pass" placeholder="">
				</div>
				<div class="form-group" align="left">
					<label for="">비밀번호재입력</label> <input type="password"
						class="form-control" id="passcheck" name="passcheck"
						placeholder="">
				</div>
				<div class="form-group" align="left">
					<label for="email">이메일</label><br>
					<div id="email" class="custom-control-inline">
						<input type="text" class="form-control" id="emailid"
							name="emailid" placeholder="" size="25"> @ <select
							class="form-control" id="emaildomain" name="emaildomain">
							<option value="naver.com">naver.com</option>
							<option value="google.com">google.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="hanmail.net">hanmail.net</option>
						</select>
					</div>
				</div>
				<div class="form-group" align="left">
					<label for="tel">전화번호</label>
					<div id="tel" class="custom-control-inline">
						<select class="form-control" id="tel1" name="tel1">
							<option value="010">010</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="041">041</option>
							<option value="051">051</option>
							<option value="061">061</option>
						</select> _ <input type="text" class="form-control" id="tel2" name="tel2"
							placeholder="1234"> _ <input type="text"
							class="form-control" id="tel3" name="tel3" placeholder="5678">
					</div>
				</div>
				<div class="form-group" align="left">
					<label for="">주소</label><br>
					<div id="addressdiv" class="custom-control-inline">
						<input type="text" class="form-control" id="zipcode"
							name="zipcode" placeholder="우편번호" size="7" maxlength="5"
							readonly="readonly">
						<!--<button type="button" class="btn btn-primary" onclick="javascript:">우편번호</button>-->
					</div>
					<input type="text" class="form-control" id="address" name="address"
						placeholder=""> <input type="text" class="form-control"
						id="address_detail" name="address_detail" placeholder="">
				</div>
				<div class="form-group" align="center">
					<button type="button" class="btn btn-primary" id="registerBtn"
						onclick="javascript:register();">회원가입</button>
					<button type="reset" class="btn btn-warning">초기화</button>
				</div>
			</form>
		</div>
	</div>

	<div id="zipModal" class="modal fade" role="dialog">
		<h5 class="modal-title" id="myModalLabel">우편번호검색</h5>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<form id="zip_codeForm">
						<div align="center">
							<label>도로명 주소검색</label>
						</div>
						<div class="input-group" align="left">
							<input type="text" class="form-control" id="doro" name="doro"
								placeholder="검색 할 도로명 입력(예: 구로디지털로, 여수울로)"> <span
								class="input-group-btn"> <input type="submit"
								class="btn btn-warning" value="검색" id="searchBtn">
							</span>
						</div>
					</form>
					<div style="width: 100%; height: 200px; overflow: auto">
						<table class="table text-center">
							<thead>
								<tr>
									<th style="width: 150px;">우편번호</th>
									<th style="width: 600px;">주소</th>
								</tr>
							</thead>
							<tbody id="zip_codeList"></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/user/zipsearch.jsp"%>   
<%@ include file="/template/footer.jsp"%>    