/* Check Image File extension */
function checkFile(id){
	var filename = $('#'+id).val();
	alert(filename);
	filename = filename.substring(filename.length-3, filename.length); //Get file extension
	if(filename!='jpg' && filename!='png'){ //Only jpg,png
		alert('jpg,png 이미지 파일만 업로드 가능합니다.');
		return false;
	}
}//checkFile()

/* GET cate2 Information List */
function showCate(idx, name, img){
	// Change Category1 Information in modal
	$('#title-row').attr('data-cateOne-idx',idx);
	$('#title-row').empty();
	$('#title-row').append('<h3 class="modal-title col-md-10" id="cate1-modal-title"><b>' + name + '</b></h3>'
						+ '<div class="col-md-1 text-end">'
						+ '<button type="button" class="btn btn-link" onclick="editCateOneNameForm()"><i class="bi bi-pencil-fill"></i></button>'
						+ '</div>');
	$('#img-row').empty();
	$('#img-row').append('<img src="' + '/hobbycampus/hobbyImg/category1/' + img + '" class="rounded-circle" id="cate1-modal-img">');
	$('#btn-plus').empty();
	$('#btn-plus').append('<button type="button" class="btn btn-outline-secondary" onclick="addCateTwoForm()"><i class="bi bi-plus"></i></button>');
	$('#cateTwo-form-area').empty();
	
	// GET cate2 Info & SET List
	$.ajax({
		type: 'GET',
		url: 'categoryTwoList.do',
		data: {'cate1_idx': idx},
		dataType: 'json',
		success: function(data){
			var $dto = data.dtos;
			var $tbody = $('.cateTwo-tbody');
			
			$tbody.empty(); //Reset tbody content
			if($dto.length==0){ //If no categotyTwo list
				$tbody.append('<tr><td colspan="4" class="text-center">하위 카테고리가 존재하지 않습니다.</td></tr>')
			}
			for(var i=0; i<$dto.length; i++){ //SET table for categoryTwo List
				$tbody.append('<tr><th scope="row" data-idx="' + $dto[i].cate2_idx +'">' + (i+1) + '</th>'
								+ '<td><img src="/hobbycampus/hobbyImg/category2/' + $dto[i].cate2_img + '" class="rounded-circle" id="cate2-img">' 
								+ '<td>'+ $dto[i].cate2_name + '</td>'
								+ '<td><button type="button" class="btn btn-success btn-sm">수정</button></td></tr>');
			}
		}
	});
}//showCate()

/* EditCateOne Name Form */
function editCateOneNameForm(){
	var $title = $('#cate1-modal-title').text();
	$('#title-row').empty();
	$('#title-row').append('<div class="form-floating mb-3">'
							+ '<div class="input-group mb-3">'
							+ '<input type="text" class="form-control fs-4" id="ed_cateOne_name" placeholder="새로운 카테고리 이름" maxlength="7" aria-describedby="edit-cateOne-name" value="'+ $title+ '" required>'
							+ '<button class="btn btn-outline-secondary" type="button" id="edit-cateOne-name" onclick="editCateOneNameSubmit()">수정</button></div></div>');
}//editCateOneForm()

/* EditCateOne Name Submit */
function editCateOneNameSubmit(){
	var $editCateoneIdx = $('#title-row').attr('data-cateOne-idx');
	var $editCateoneName = $('#ed_cateOne_name').val();
	
	$.ajax({
		type: 'GET',
		url: 'categoryOneEditName.do',
		data: {'cate1_idx':$editCateoneIdx, 'cate1_name':$editCateoneName},
		dataType: 'json',
		success: function(data){
			alert(data.msg);
			window.location.reload();
		}
	});
}//editCateOneNameSubmit()

/* ADD Category Two Form */
function addCateTwoForm(){
	var $toAddCateOneIdx = $('#title-row').attr('data-cateOne-idx');
	
	$('#btn-plus').empty();
	$('#cateTwo-form-area').append('<form name="cateTwoForm" action="uploadCateTwo.do" method="post" enctype="multipart/form-data" class="m-4">'
						+ '<hr class="my-4">'
						+ '<div class="form-floating mb-3 text-center fs-5">작은 카테고리 생성</div>'
						+ '<div class="form-floating mb-3">'
						+ '<input type="text" class="form-control rounded-4" name="cate2_name" id="cate2_name" maxlength="7" placeholder="작은 카테고리 이름 입력" required>'
						+ '<label for="cate2_name">작은 카테고리 이름</label></div>'
						+ '<div class="mb-3">'
						+ '<label for="formFile" class="form-label">파일 업로드</label>'
						+ '<input class="form-control" type="file" name="cateTwoUpload" id="cate2_img" required></div>'
						+ '<input type="hidden" name="cate1_idx" value="' + $toAddCateOneIdx + '">'
						+ '<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit" onclick="return checkFile(\'cate2_img\')">생성하기</button></form>');
}//addCateTwoForm()
	
	