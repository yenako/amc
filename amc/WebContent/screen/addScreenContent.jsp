<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<div class="ui  tiny modal addScreenContentModal">


	<div class="ui header">상영등록</div>

	<div class="addScreenContentWrapper col-md-12 col-sm-12">
		<div>
			<div class="col-md-6 col-sm-6 addScreenContentTitle">상영일자</div>
			<div class="col-md-6 col-sm-6">
				<input type="text" name="screenDate" readonly="readonly">
			</div>
		</div>
		<div>
			<div class="col-md-6 col-sm-6 addScreenContentTitle">상영관</div>
			<div class="col-md-6 col-sm-6">
				<select name="screenTheater" disabled="disabled">
					<option value="1">1상영관</option>
					<option value="2">2상영관</option>
				</select>
			</div>
		</div>
		<div>
			<div class="col-md-6 col-sm-6 addScreenContentTitle">상영시작시간</div>
			<div class="col-md-6 col-sm-6">
				<input type="time" name='screenContentOpenTime' readonly="readonly">
			</div>
		</div>
		<div class="endTime">
			<div class="col-md-6 col-sm-6 addScreenContentTitle">상영종료시간</div>
			<div class="col-md-6 col-sm-6">
				<input type="time" name='screenContentEndTime' readonly="readonly">
			</div>
		</div>

		<div>
			<div class="col-md-6 col-sm-6 addScreenContentTitle">가격</div>
			<div class="col-md-6 col-sm-6">
				<input type="text" placeholder="가격" name='ticketPrice'>
			</div>
		</div>
		<div>
			<div class="col-md-6 col-sm-6 addScreenContentTitle">시사회</div>
			<div class="col-md-1 col-sm-1">
				<input type="checkbox" class="checkbox styled" name='previewChecked'>
			</div>
			<div class="col-md-5 col-sm-5 checkPreviewWrapper"></div>
		</div>
		<div>
			<div class="col-md-6 col-sm-6 addScreenContentTitle">시사회제목</div>
			<div class="col-md-6 col-sm-6">
				<input type="text" placeholder="시사회제목" name='previewTitle' readonly="readonly">
			</div>
		</div>
		<div>
			<div class="col-md-6 col-sm-6 addScreenContentTitle">티켓오픈날짜</div>
			<div class="col-md-6 col-sm-6">
				<input type="text" name='previewOpenDate' readonly="readonly">
				<input type="time" name='previewOpenTime' readonly="readonly">
			</div>
		</div>
		<div>
			<div class="col-md-6 col-sm-6 addScreenContentTitle">초대배우</div>
			<div class="col-md-6 col-sm-6">
				<input type="text" placeholder="초대배우" name='inviteActor' readonly="readonly">
			</div>
		</div>

	</div>


	<div class="actions">
		<div class="ui positive right labeled icon button actionAddButton">
			등록 <i class="checkmark icon"></i>
		</div>
		<div class="ui black deny button actionCancleButton">취소</div>

	</div>

</div>