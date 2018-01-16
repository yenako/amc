<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<!-- Basic Page Needs -->
<meta charset="utf-8">
<title>AMC ȸ������ ������</title>



<!--   Sweetalert2 CDN  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.0/sweetalert2.all.min.js"></script>

<!-- ���� �ּ� CDN -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>

<body bgcolor="#ffffff" text="#000000">
	<div class="wrapper">
		<!-- Banner -->
		<div class="banner-top">
			<img alt='top banner' src="../images/banners/space.jpg">
		</div>
		<header class="header-wrapper header-wrapper--home">
			<jsp:include page="/layout/topToolbar.jsp" />
		</header>

		<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
		<div class="container" id="body">
			<div class="page-header text-center">
				<h3 class="text-info">ȸ �� �� ��</h3>
			</div>
			<br />
			<br />
			<!-- form Start /////////////////////////////////////-->
			<form id="addUser-form" class="form row" method='post' novalidate="">
				<input type="hidden" value="${param.phone1}" id="authPhone1" name="phone1">
				<input type="hidden" value="${param.phone2}" id="authPhone2" name="phone2">
				<input type="hidden" value="${param.phone3}" id="authPhone3" name="phone3">
				<input type="hidden" value="${snslogin}" id="snslogin" name="snsLogin">

				<div class="row">
					<label for="userId" class="col-sm-offset-1 col-sm-3 control-label"><strong>�� �� ��</strong></label>
					<div class="col-sm-4" style="display: inline">
						<c:if test="${!empty param.phone2}">
							<input type="text" class="inputtype" value="${email}" id="userId" name="userId" placeholder="ID�Է�" aria-describedby="helpBlock" />
						</c:if>
						<c:if test="${empty param.phone2}">
							<input type="text" class="inputtype" value="${email}" id="userId" name="userId" placeholder="ID�Է�" aria-describedby="helpBlock" readonly />
						</c:if>
					</div>
					<div class="col-sm-3" style="display: inline">
						<span id="helpBlock" class="help-block col-sm-6"></span>
					</div>
				</div>
				<%-- <c:if test="${sessionScope.user.role == 'admin'}"> --%>
				<c:if test="${empty snslogin}">
					<div class="row">
						<label for="password" class="col-sm-offset-1 col-sm-3 control-label"><strong>��й�ȣ �Է�</strong></label>
						<div class="col-sm-4" style="display: inline">
							<input type="password" class="inputtype" id="password" name="password" placeholder="��й�ȣ 8�ڸ� �̻�~12�ڸ� ����" maxlength="12">
						</div>
					</div>

					<div class="row">
						<label for="password2" class="col-sm-offset-1 col-sm-3 control-label"><strong>��й�ȣ Ȯ��</strong></label>
						<div class="col-sm-4" style="display: inline">
							<input type="password" class="inputtype" id="password2" name="password2" placeholder="��й�ȣ Ȯ��" aria-describedby="helpBlock2" maxlength="12">
						</div>
						<div class="col-sm-3" style="display: inline">
							<span id="helpBlock2" class="help-block2 col-sm-6"></span>
						</div>
					</div>
				</c:if>

				<div class="row">
					<label for="userName" class="col-sm-offset-1 col-sm-3 control-label"><strong>�̸�</strong></label>
					<div class="col-sm-4" style="display: inline">
						<input type="text" class="inputtype" id="userName" name="userName" placeholder="ȸ���̸�">
					</div>
				</div>


				<div class="row">
					<label for="birth" class="col-sm-offset-1 col-sm-3 control-label"><strong>�� �� �� ��</strong></label>
					<div class="col-sm-4" style="display: inline">
						<input type="text" class="inputtype" name="birth" id="birth" placeholder="�������" readonly>
					</div>
				</div>

				<div class="row">
					<label for="calendarType" class="col-sm-offset-1 col-sm-3 control-label"><strong>������� ����</strong></label>
					<div class="col-sm-4" style="display: inline">
						<select class="search-sort" name="calendarType" id="calendarType">
							<option value="S">���</option>
							<option value="L">����</option>
						</select>
					</div>
				</div>

				<div class="row">
					<label for="gender" class="col-sm-offset-1 col-sm-3 control-label"><strong>�� ��</strong></label>
					<div class="col-sm-4" style="display: inline">
						<select class="search-sort" name="gender" id="gender">
							<option value="M">����</option>
							<option value="F">����</option>
						</select>
					</div>
				</div>


				<div class="row">
					<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"><strong>�����ȣ</strong></label>
					<div class="col-sm-4" style="display: inline">
						<input type="text" class="inputtype" id="postcode" placeholder="�����ȣ" readonly>
					</div>

					<div class="col-sm-2">
						<input type="button" class="btn btn-md btn--info" onclick="execDaumPostcode()" value="�����ȣ ã��" readonly="readonly">
					</div>
				</div>

				<div class="row">
					<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"><strong>�ּ�</strong></label>
					<div class="col-sm-4" style="display: inline">
						<input type="text" name='addr' class="inputtype" id="address" placeholder="�ּ�">
					</div>
				</div>

				<div class="row">
					<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label"><strong>���ּ�</strong></label>
					<div class="col-sm-4" style="display: inline">
						<input type="text" name='addrDetail' class="inputtype" id="address_detail" placeholder="���ּ�">
					</div>
				</div>
				<c:if test="${empty param.phone1}">
					<div class="row">
						<label for="phone" class="col-sm-offset-1 col-sm-3 control-label"><strong>�޴���ȭ��ȣ</strong></label>
						<div class="col-sm-2" style="display: inline">
							<select class="search-sort" name="phone1" id="phone1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
						</div>
						<div class="col-sm-2">
							<input type="text" class="inputtype" id="phone2" name="phone2" placeholder="��ȣ" maxlength="5">
						</div>
						<div class="col-sm-2">
							<input type="text" class="inputtype" id="phone3" name="phone3" placeholder="��ȣ" maxlength="5">
						</div>
					</div>
				</c:if>
				<br/><br/>
				<div class="row">
					<div class="col-sm-offset-4  col-sm-4 text-center">
						<button id="addUser" type="button" class="btn btn-md btn--info">�� &nbsp;��</button>
					</div>
				</div>
				<br/><br/>
			</form>
		</div>
	</div>
	<jsp:include page="/layout/bottomToolbar.jsp" />
	<jsp:include page="/layout/loginModal.jsp" />

	<script src="/js/external/jquery-migrate-1.2.1.min.js"></script>
	<!-- jQuery UI -->
	<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

	<!-- Custom -->
	<script src="/js/custom.js"></script>



</body>
<script type="text/javascript">
    var check = false;
    //============= "����"  Event ���� =============
    $(function() {
        //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        $("#addUser").on("click", function() {
            fncCheckUser();
            /* fncAddUser(); */
        });
        date = new Date();
        $("input[name='birth']").datepicker({
            dateFormat : 'yy-mm-dd',
            maxDate : date,
            yearRange : '1900:2030',
            changeMonth : true,
            changeYear : true,
            monthNames : ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��']
        });

    });

     		//============= "���"  Event ó�� ��  ���� =============
/*      $(function() {
     //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
     $("a[href='#' ]").on("click" , function() {
     $("form")[0].reset();
     });
     });	
    
      */
    function fncAddUser() {
        var id = $("input[name='userId']").val();
        var pw = $("input[name='password']").val();
        var pw_confirm = $("input[name='password2']").val();
        var name = $("input[name='userName']").val();
        var birth = $("input[name='birth']").val();
        var phone1 = $("#phone1").val();
        var phone2 = $("#phone2").val();
        var phone3 = $("#phone3").val();
        var snslogin = $("#snslogin").val();
        var check = true
        
        if (id == null || id.length < 1) {
            alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
            /* return check=false; */
            return;
        }
        if (id != null && (id.indexOf('@') < 1 || id.indexOf('.') == -1)) {
            alert("�̸��������̾ƴմϴ�.");
            return;
        }

        if (snslogin == '') {
            if (pw == null || pw.length < 8) {
                alert("�н������  �ݵ�� 8�ڸ� �̻� �Է��ϼž� �մϴ�.");
                /* return check=false; */
                return;
            }
            if (pw_confirm == null || pw_confirm.length < 1) {
                alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
                /* return check=false; */
                return;
            }
            if (name == null || name.length < 1) {
                alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
                /* return check=false; */
                return;
            }
            if (pw != pw_confirm) {
                alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
                $("input:text[name='password2']").focus();
                /* return check=false; */
                return;
            }
        }

        if (birth == null || birth.length < 1) {
            alert("��������� �ݵ�� �Է��ؾ��մϴ�.");
            /* return check=false; */
            return;
        }

        if ($("#authPhone1").val() == "") {

            if ($("#phone2").val() == "" || $("#phone3").val() == "") {
                alert("�޴��� ��ȣ�� �ݵ�� ��� �Է��ؾ��մϴ�.");
                return;
            }

            if ($("#phone2").val().length < 3) {
                alert("�޴��� ��ȣ�� 3�ڸ� �̻� �̿����մϴ�.");
                return;
            }

            if ($("#phone3").val().length < 3) {
                alert("�޴��� ��ȣ�� 3�ڸ� �̻� �̿����մϴ�.");
                return;
            }
            
            if (!$.isNumeric(phone2) || !$.isNumeric(phone3) ) {
                alert('�޴��� ��ȣ�� ���ڸ� �Է��� �����մϴ�');
                return;
            } 
        }
        /* $("input:hidden[name='phone']").val( value ); */

        $.ajax({
        	url : "/user/json/getPhone",
            method : "POST",
            async : false,
            headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json"
            },
            data : JSON.stringify({
                phone1 : phone1,
                phone2 : phone2,
                phone3 : phone3
            }),
            success : function(JSONData, status) {
                if (JSONData == '') {
                    if (check == true) {
                        alert('ȸ�������� �����մϴ�.');
                        $("#addUser-form").attr("method", "POST").attr("action", "/user/addUser").submit();
                    }
                } else {
                    alert("�̹� ��ϵ� �޴����Դϴ�.");
                }
            },
            error : function(request, status, error) {
                //alert(error);
                //alert("���̵� , �н����带 Ȯ���Ͻð� �ٽ� �α���2...");
            }
        });

        /* $("form").attr("method" , "POST").attr("action" , "/user/addUser").submit(); */
    }


    //==>""�̸���" ��ȿ��Check / ID�ߺ�Ȯ��" Event ó�� �� ����
$(function(){					
     $('#userId').bind('keyup', function(){
	     var userId = $(this).val().trim();
	     var tempId = userId.split(".");
	     console.log("userId :: " + userId);
	     console.log("tempId :: " + tempId);
	     $.ajax({
	     url : 'json/checkDuplication/'+tempId,
	     method : 'get',
	     dataType : 'json', 
	     headers : {
	     'Accept' : 'application/json',
	     'Content-Type' : 'application/json'
	     }, 
	     success : function(JSONData , status){
	    if(JSONData){
	    	$('span.help-block').html('��밡���� ���̵� �Դϴ�.').css('color','blue');
	    	check = true;
	    }else{
	    	$('span.help-block').html('�̹� �����ϴ� ���̵� �Դϴ�.').css('color','red');
	    	check = false;
	    }
	    }
	    });
	    
	    if(userId == ''){
	    $('span.help-block').html('');
	    }
	    
	    });
	    });
    
//==>""�̸���" ��ȿ��Check / ID�ߺ�Ȯ��" Event ó�� �� ����
$(function(){					
	$('#userId').bind('keyup', function(){
		var userId = $(this).val().trim();
		var tempId = userId.split(".");
    	console.log("email :: " + email);
     	console.log("tempId :: " + tempId);
			$.ajax({
				url : 'json/checkDuplication/'+tempId,
				method : 'get',
				dataType : 'json', 
				 headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/json'
				}, 
				success : function(JSONData , status){
					/* alert("JSONData" + JSONData); */
					if(JSONData){
						$('span.help-block').html('��밡���� ���̵� �Դϴ�.').css('color','blue');
						check = true;
					}else{
						$('span.help-block').html('�̹� �����ϴ� ���̵� �Դϴ�.').css('color','red');
						check = false;
					}
				}
			});
		
			if(userId == ''){
				$('span.help-block').html('');
			}
	      
	});
});		

    
    
     
     function fncCheckUser() {
        var userId = $("input[name='userId']").val().trim();
        var tempId = userId.split(".");
        console.log("userId :: " + userId);
        console.log("tempId :: " + tempId);
        $.ajax({
            url : '/user/json/checkDuplication/' + tempId,
            method : 'get',
             async : false,
            dataType : 'json',
            headers : {
                'Accept' : 'application/json',
                'Content-Type' : 'application/json'
            },
            success : function(JSONData, status) {
                if (JSONData) {
                	$('span.help-block').html('��밡���� ���̵� �Դϴ�.').css('color','blue');
                	check = true;
                    fncAddUser();
                    
                } else {
                	$('span.help-block').html('�̹� �����ϴ� ���̵� �Դϴ�.').css('color','red');
                    alert("�̹� �����ϴ� ���̵��Դϴ�.");
                    check = false;
                    return;
                }
            }
        });

        if (userId == '') {
            $('span.help-block').html('');
        }
    } 

    $(function() {
        $('#password2').bind('keyup', function() {
            if ($('#password').val() != $(this).val()) {
                $('span.help-block2').text("��й�ȣ�� �ٸ��ϴ�.").css('color', 'red');
            } else {
                $('span.help-block2').text("Ȯ��").css('color', 'blue');
            }
        });
    });

    ////���� �ּ� API////////////////////////////////////////////////////////////////////////////////////////////////
    function execDaumPostcode() {

        new daum.Postcode({
            oncomplete : function(data) {

                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullAddr = ''; // ���� �ּ� ����
                var extraAddr = ''; // ������ �ּ� ����

                // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    fullAddr = data.roadAddress;

                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    fullAddr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
                if (data.userSelectedType === 'R') {
                    //���������� ���� ��� �߰��Ѵ�.
                    if (data.bname !== '') {
                        extraAddr += data.bname;
                    }
                    // �ǹ����� ���� ��� �߰��Ѵ�.
                    if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                    fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('address').value = fullAddr;

                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById('address_detail').focus();
            },

            theme : {
                bgColor : "#ECECEC", //���� ����
                searchBgColor : "#0B65C8", //�˻�â ����
                contentBgColor : "#FFFFFF", //���� ����(�˻����,��l������,ùȭ��,�˻�������Ʈ)
                pageBgColor : "#FAFAFA", //������ ����
                textColor : "#333333", //�⺻ ���ڻ�
                queryTextColor : "#FFFFFF", //�˻�â ���ڻ�
                postcodeTextColor : "#FA4256", //�����ȣ ���ڻ�
                emphTextColor : "#008BD3", //���� ���ڻ�
                outlineColor : "#E0E0E0" //�׵θ�
            }

        }).open();
    }


</script>
<style type="text/css">
#body {
	/* background-color: #EDEDED; */
	background-color: #ffffff;
	margin-top: 100px;
	margin-bottom: 5px;
	padding-top: -50px;
	/* padding-top: 10px;
	    padding-bottom: 10px; */
	/*padding-left: 20px;
	    padding-right: 20px; */
	/* margin-left: 1px;
	    margin-right: 1px; */
	padding-bottom: 10px;
	border-radius: 15px;
	border-color: #000000;
	border-width: 30px;
	box-shadow: inset 0 0 10px #a0a0a0;
}

html {
	height: auto;
}

.inputtype {
	margin-bottom: 10px;
	width: 100%;
	border: none;
	box-shadow: none;
	border: 1px solid #dbdee1;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	font-size: 13px;
	color: #000000;
	padding: 9px 18px 10px !important;
	position: relative;
}

input, #phone1, #calendarType, #gender {
	margin-bottom: 10px;
	height: 100%;
	width: 100%;
	border: none;
	box-shadow: none;
	border: 1px solid #dbdee1;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	font-size: 13px;
	color: #000000;
	padding: 9px 18px 10px !important;
}

.ui-datepicker {
	border: none;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
	padding: 0;
	margin-left: auto;
	margin-top: 15px;
	background-color: #4c4145;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.17);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.17);
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.17);
	position: relative;
}
</style>



</html>