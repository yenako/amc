<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!doctype html>

	    <!-- open/close -->
        <div class="overlay overlay-hugeinc  z-index: 1000">
            
            <section class="container">

                <div class="col-sm-4 col-sm-offset-4">
                    <button type="button" class="overlay-close">Close</button>
                    <form id="login-form" name="login" class="login" method='POST' novalidate='' action='Javascript:fncloginUser'>
                        <p class="login__title">로그인<br><span class="login-edition">welcome to Americode Cinema!</span></p>

                        <div class="social social--colored">
                                <!-- <a href='' img src='../images/user/kakaobtn.png'></a>&emsp; -->
                                <!-- <a href='/sns/kakaoGetCode' class="social_variant"><img src="../images/user/kakaobtn.png"></a>&emsp; -->
                                <a href='javascript:loginWithKakao()' class="social_variant"><img src="../images/user/kakaobtn.png"></a>&emsp;
                                <a href='/sns/naver' class="social_variant"><img src="../images/user/naverbtn.PNG" width='34px'></a>
                               <!--  <a href='#' class="social__variant fa fa-twitter"></a> -->
                                
                        </div>

                        <p class="login__tracker">환영합니다<br/> 좋은시간보내세요!</p>
                        
                        <div class="field-wrap">
                        <input type='email' placeholder='Email'  id='userId' name='userId' class="login__input" onkeypress="if(event.keyCode==13) {loginUser(); return false;}">
                        <input type='password' placeholder='Password' id='password' name='password' class="login__input" onkeypress="if(event.keyCode==13) {loginUser(); return false;}">
						<br/><br/><br/>
                         </div>
                        
                        <div class="login__control">
                            <button type='button' id ='login' class="btn btn-md btn--warning btn--wider">로그인</button>
                            <a href="/user/authForm.jsp" class="login__tracker form__tracker">회원 가입</a>
                            <a href="/user/findUser.jsp" class="login__tracker form__tracker">아이디/비밀번호 찾기</a>
                        </div>
                    </form>
                </div>

            </section>
        </div>

        