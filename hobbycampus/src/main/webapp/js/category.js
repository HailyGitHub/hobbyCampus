/* Check Image File extension */
function checkFile(id){
	var filename = $('#'+id).val();
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
						+ '<button type="button" class="btn btn-link" id="btn-cateOne-edit" onclick="editCateOneForm()"><i class="bi bi-pencil-fill"></i></button>'
						+ '</div>');
	$('#img-row').empty();
	$('#img-row').append('<img src="' + '/hobbycampus/hobbyImg/category1/'+img+'" class="rounded-circle" data-img="'+img+'" id="cate1-modal-img">');
	$('#btn-plus').empty();
	$('#btn-plus').append('<button type="button" class="btn btn-outline-secondary" onclick="addCateTwoForm()"><i class="bi bi-plus"></i></button>');
	$('#cateOne-form-area').empty();
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
								+ '<td><button type="button" class="btn btn-success btn-sm"'
								+ 'onclick="editCateTwoForm('+$dto[i].cate2_idx+',\''+$dto[i].cate2_name+'\',\''+$dto[i].cate2_img+'\')">수정</button></td></tr>');
			}
		}
	});
}//showCate()


/* Edit Category One Form */
function editCateOneForm(){
	var $title = $('#cate1-modal-title').text();
	var $idx = $('#title-row').attr('data-cateOne-idx');
	var $img = $('#cate1-modal-img').attr('data-img');
	
	$('#btn-cateOne-edit').empty();
	$('#cateOne-form-area').append('<form name="cateOneEditForm" action="editCateOne.do" method="post" enctype="multipart/form-data" class="m-4">' //editCateOne.do
						+ '<div class="form-floating mb-3 text-center fs-5"><i class="bi bi-wrench-adjustable-circle-fill"></i> 큰 카테고리 수정 <i class="bi bi-wrench-adjustable-circle-fill"></i></div>'
						+ '<div class="form-floating mb-3">'
						+ '<input type="text" class="form-control rounded-4" name="cate1_name" id="cate1_name" value="'+$title+'" maxlength="7" placeholder="작은 카테고리 이름 입력" required>'
						+ '<label for="cate1_name">작은 카테고리 이름</label></div>'
						+ '<div class="mb-3">'
						+ '<label for="formFile" class="form-label">파일 업로드</label>'
						+ '<input class="form-control" type="file" name="cateOneUpload" id="cate1_img" required></div>'
						+ '<input type="hidden" name="cate1_idx" value="'+$idx+'">'
						+ '<input type="hidden" name="cate1_img" value="'+$img+'">'
						+ '<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit" onclick="return checkFile(\'cate2_img\')">수정하기</button></form>');
}//editCateOneForm()


/* ADD Category Two Form */
function addCateTwoForm(){
	var $toAddCateOneIdx = $('#title-row').attr('data-cateOne-idx');
	
	$('#btn-plus').empty();
	$('#cateTwo-form-area').empty();
	$('#cateTwo-form-area').append('<form name="cateTwoForm" action="uploadCateTwo.do" method="post" enctype="multipart/form-data" class="m-4">'
						+ '<div class="form-floating mb-3 text-center fs-5"><i class="bi bi-bookmark-plus-fill"></i> 작은 카테고리 생성 <i class="bi bi-bookmark-plus-fill"></i></div>'
						+ '<div class="form-floating mb-3">'
						+ '<input type="text" class="form-control rounded-4" name="cate2_name" id="cate2_name" maxlength="7" placeholder="작은 카테고리 이름 입력" required>'
						+ '<label for="cate2_name">작은 카테고리 이름</label></div>'
						+ '<div class="mb-3">'
						+ '<label for="formFile" class="form-label">파일 업로드</label>'
						+ '<input class="form-control" type="file" name="cateTwoUpload" id="cate2_img" required></div>'
						+ '<input type="hidden" name="cate1_idx" value="' + $toAddCateOneIdx + '">'
						+ '<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit" onclick="return checkFile(\'cate2_img\')">생성하기</button></form>');
}//addCateTwoForm()


/* EDIT Category Two Form */
function editCateTwoForm(idx, name, img){
	$('#btn-plus').empty();
	$('#btn-plus').append('<button type="button" class="btn btn-outline-secondary" onclick="addCateTwoForm()"><i class="bi bi-plus"></i></button>');
	$('#cateTwo-form-area').empty();
	$('#cateTwo-form-area').append('<form name="cateTwoEditForm" action="editCateTwo.do" method="post" enctype="multipart/form-data" class="m-4">'
						+ '<div class="form-floating mb-3 text-center fs-5"><i class="bi bi-wrench-adjustable-circle-fill"></i> 작은 카테고리 수정 <i class="bi bi-wrench-adjustable-circle-fill"></i></div>'
						+ '<div class="form-floating mb-3">'
						+ '<input type="text" class="form-control rounded-4" name="cate2_name" id="cate2_name" value="'+name+'" maxlength="7" placeholder="작은 카테고리 이름 입력" required>'
						+ '<label for="cate2_name">작은 카테고리 이름</label></div>'
						+ '<div class="mb-3">'
						+ '<label for="formFile" class="form-label">파일 업로드</label>'
						+ '<input class="form-control" type="file" name="cateTwoUpload" id="cate2_img" required></div>'
						+ '<input type="hidden" name="cate2_idx" value="'+idx+'">'
						+ '<input type="hidden" name="cate2_img" value="'+img+'">'
						+ '<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit" onclick="return checkFile(\'cate2_img\')">수정하기</button></form>');
}//editCateTwoForm()
	
	