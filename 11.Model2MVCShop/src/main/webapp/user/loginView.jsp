<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    	 body >  div.container{ 
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	Kakao.init('2e00cfe75ad365584acc76b588be8d74');
	

		//============= "�α���"  Event ���� =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID �� �Է����� �����̽��ϴ�.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('�н����带 �Է����� �����̽��ϴ�.');
					$("#password").focus();
					return;
				}
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
		
		
		//============= ȸ������ȭ���̵� =============
		$( function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#']").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		
/* 20210703 īī���α��� ��ư ������ /user/addUser�� �̵��Ѵ�.

$(function(){
	
	$("#custom-login-btn").on("click", function() {
		self.location = "/user/addUser"
	});
	
});
*/

		//============= īī�� "�α���" PopUp Event ���� =============
	/*
		function kakaoLogin() {
			Kakao.Auth.login({
				success : function(response) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							console.log(response)
						},
						fail : function(error) {
							console.log(error)
						},
					})
				},
				fail : function(error) {
					console.log(error)
				},
			})
		}
	*/

	function kakaoLogin() {
		Kakao.Auth.login({
			scope:'account_email',
			
			success : function(authObj) {
				console.log(authObj);
				alert("authObj 1�� ����");
				
				Kakao.API.request({
				       url: '/v2/user/me',
					success: function(response){
						alert("2�� ����");
						console.log("īī������ : "+response.kakao_account);
						console.log("�̸����ּ� : "+response.kakao_account['email']);
						self.location = "http://localhost:8080/user/addUserView.jsp"
					}
				});
			}
		});
		
	}
	
/*
		============= īī�� "�α���" Redirect URI ���� =============
		function kakaoLogin() {
			Kakao.Auth.login({
				
				success: function(authObj) {

					 Kakao.API.request({
					       url: '/v2/user/me',
					       data: {
					           
					       },
					       success: function(response) {
					    	   
					             alert(JSON.stringify(response));
					             alert(JSON.stringify(authObj)); 
					             
					             console.log("id ������� : "+response.id);				// id �������
					             console.log("connecting �ð� : "+response.connected_at);	// connected_at �α��νð� ���
					             
					             console.log("īī������ : "+response.kakao_account);	// kakao_account �����׸��ǻ��� ���
					             console.log("�̸����ּ� : " +response.kakao_account['email']);
					             console.log("���� : " +response.kakao_account['gender']);	//<---- �ܼ� �α׿� email ���� ��� (������� �˰���?)
					             					             				             
					             console.log("access_token : " +authObj.access_token);//
					             console.log("token_type : : " +authObj.token_type);
					             console.log("refresh_token : " +authObj.refresh_token);
					             console.log("expires_in : " +authObj.expires_in);
					             console.log("refresh_token_expires_in : "+authObj.refresh_token_expires_in);
								/* $.ajax({
									 url : '/user/json/addUser',
									 data : JSON.stringify(response),
									 method : 'post',
									 type : 'JSON',
									 success : function(err, data)
								 })*
					       },
					       fail: function(error){
					    	   alert(JSON.stringify(error));
					       }
					 })
				},
				fail: function(error){
			    	   alert(JSON.stringify(error));
			       }

			})
		}
	*/
		
		function kakaoLogout() {
			if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url : '/v2/user/unlink',
					success : function(response) {
						alert("����");
						console.log(response)
					},
					fail : function(error) {
						console.log(error)
					},
				})
				Kakao.Auth.setAccessToken(undefined)
			}
		}

		//============= ���� "�α���" Event ���� =============
		/*
		<meta name ="google-signin-client_id" content="959630660117-f5d12kulu8hloob7jid8f0jfeenr57sv.apps.googleusercontent.com">
			function init() {
				gapi.load('auth2', function() {
					gapi.auth2.init();
					options = new gapi.auth2.SigninOptionsBuilder();
					options.setPrompt('select_account');
			        // �߰��� Oauth ���� ���� �߰� �� ���� �������� �߰�
					options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
			        // �ν��Ͻ��� �Լ� ȣ�� - element�� �α��� ��� �߰�
			        // GgCustomLogin�� li�±׾ȿ� �ִ� ID, ���� ������ options�� �Ʒ� ����,���н� �����ϴ� �Լ���
					gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
				})
			}
		
			function onSignIn(googleUser) {
				var access_token = googleUser.getAuthResponse().access_token
				$.ajax({
			    	// people api�� �̿��Ͽ� ������ �� ������Ͽ� ���� ���õ����� �����´�.
					url: 'https://people.googleapis.com/v1/people/me'
			        // key�� �ڽ��� API Ű�� �ֽ��ϴ�.
					, data: {personFields:'birthdays', key:'AIzaSyD3N7qWQr_bjwh9Lw-fLaK8bW5GtqbvAV8', 'access_token': access_token}
					, method:'GET'
				})
				.done(function(e){
			        //�������� �����´�.
					var profile = googleUser.getBasicProfile();
					console.log(profile)
				})
				.fail(function(e){
					console.log(e);
				})
			}
			function onSignInFailure(t){		
				console.log(t);
			}
		 */
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
		<div class="row">
		
			<div class="col-md-6">
					<img src="/images/logo-spring.png" class="img-rounded" width="100%" />
			</div>
	   	 	
	 	 	<div class="col-md-6">
	 	 	
		 	 	<br/><br/>
				
				<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">�� &nbsp;&nbsp;�� &nbsp;&nbsp;��</h1>
		 	 		<br/>

			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label" >ID</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="ID" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">Password</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="password" id="password" placeholder="Password" >
					    </div>
					  </div>
<!-- ############################################################################################################################################## -->	
				  
					<a id="custom-login-btn" href="javascript:kakaoLogin()">
						<img src="https://img1.daumcdn.net/thumb/R1280x0/
						?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net
						%2Fdn%2FbN40ps%2FbtqETLcjsMw%2FCw2ZN9kFTOGqkYTxw5KBDK%2Fimg.png" 
						style="height:38px;width:auto;"/>	
					</a>
					
					<p id="token-result"></p>

<!-- ############################################################################################################################################## -->	 
					
					<a id="custom-logout-btn" href="javascript:kakaoLogout()"> 
						�α׾ƿ�
					</a>
	
<!-- ############################################################################################################################################## -->	 
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-primary"  >�� &nbsp;�� &nbsp;��</button>
					      <a class="btn btn-primary btn" href="#" role="button">ȸ &nbsp;�� &nbsp;�� &nbsp;��</a>
					    </div>
					  </div>
					  
					<ul>
						<li id="GgCustomLogin">
							<a href="javascript:void(0)">
								<span>Login with Google</span>
							</a>
						</li>
					</ul>
				
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

</html>