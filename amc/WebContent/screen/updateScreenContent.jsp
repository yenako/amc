<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<div class="ui  tiny modal updateScreenContentModal">



	<div class="ui header">�󿵼���</div>

	<div class="updateScreenContentWrapper col-md-12 col-sm-12">
		<div>
			<div class="col-md-6 col-sm-6 updateScreenContentTitle">������</div>
			<div class="col-md-6 col-sm-6">
				<input type="text" name="screenDate" readonly="readonly">
			</div>
		</div>
		<div>
			<div class="col-md-6 col-sm-6 updateScreenContentTitle">�󿵰�</div>
			<div class="col-md-6 col-sm-6">
				<select name="screenTheater" disabled="disabled">
					<option value="1">1�󿵰�</option>
					<option value="2">2�󿵰�</option>
				</select>
			</div>
		</div>
		<div>
			<div class="col-md-6 col-sm-6 updateScreenContentTitle">�󿵽��۽ð�</div>
			<div class="col-md-6 col-sm-6">
				<input type="time" name='screenContentOpenTime' readonly="readonly">
			</div>
		</div>
		<div class="endTime">
			<div class="col-md-6 col-sm-6 updateScreenContentTitle">������ð�</div>
			<div class="col-md-6 col-sm-6">
				<input type="time" name='screenContentEndTime' readonly="readonly">
			</div>
		</div>

		<div>
			<div class="col-md-6 col-sm-6 updateScreenContentTitle">����</div>
			<div class="col-md-6 col-sm-6">
				<input type="text" placeholder="����" name='ticketPrice'>
			</div>
		</div>
		<div>
			<div class="col-md-6 col-sm-6 updateScreenContentTitle">�û�ȸ</div>
			<div class="col-md-1 col-sm-1 checkFlag">
				<!-- <input type="checkbox" class="checkbox styled" name='previewChecked' id="previewChecked"> -->
			</div>
			<div class="col-md-5 col-sm-5 checkPreviewWrapper"></div>
		</div>
		<div>
			<div class="col-md-6 col-sm-6 updateScreenContentTitle">�û�ȸ����</div>
			<div class="col-md-6 col-sm-6">
				<input type="text" placeholder="�û�ȸ����" name='previewTitle' readonly="readonly">
			</div>
		</div>
		<div>
			<div class="col-md-6 col-sm-6 updateScreenContentTitle">Ƽ�Ͽ��³�¥</div>
			<div class="col-md-6 col-sm-6">
				<input type="text" name='previewOpenDate' readonly="readonly">
				<input type="time" name='previewOpenTime' readonly="readonly">
			</div>
		</div>
		<div>
			<div class="col-md-6 col-sm-6 updateScreenContentTitle">�ʴ���</div>
			<div class="col-md-6 col-sm-6">
				<input type="text" placeholder="�ʴ���" name='inviteActor' readonly="readonly">
			</div>
		</div>

	</div>


	<div class="actions">
		<div class="ui positive right labeled icon button actionUpdateButton">
			���� <i class="checkmark icon"></i>
		</div>
		<div class="ui black deny button actionCancleButton">���</div>

	</div>




</div>





