<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Footer -->
<footer>
    <div class="footer_p1" id="secret_pwd1" data-pwd="1"></div>
    <div class="footer_p2" id="secret_pwd2" data-pwd="2">
        <!-- Modal List -->
        <ul class="nav justify-content-center">
            <li class="nav-item">
              <a class="nav-link text-dark" href="#" onclick="showUs()" data-bs-toggle="modal" data-bs-target="#aboutModal"><b>회사소개</b></a>
            </li>
            <li class="nav-item" data-bs-toggle="modal" data-bs-target="#aboutModal">
                <a class="nav-link text-dark" href="#" onclick="showHR()"><b>인사채용</b></a>
            </li>
            <li class="nav-item" data-bs-toggle="modal" data-bs-target="#aboutModal">
                <a class="nav-link text-dark" href="#" onclick="showPolicy()"><b>운영정책</b></a>
            </li>
            <li class="nav-item" data-bs-toggle="modal" data-bs-target="#aboutModal">
                <a class="nav-link text-dark" href="#" onclick="showCenter()"><b>고객센터</b></a>
            </li>
        </ul>
        <!-- Modal -->
        <div class="modal fade" id="aboutModal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="ModalLabel"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="modal-body">
                  
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">내용확인</button>
                </div>
            </div>
            </div>
        </div>
    </div>        
    <div class="footer_p1" id="secret_pwd3" data-pwd="3"></div>
    <div class="footer_p2 text-center" id="secret_enter" data-bs-toggle="modal" data-bs-target="">
      <p>Copyright 2021. Hobby Campus Co., Ltd. all rights reserved.</p>
    </div>
</footer>

<!-- Script to access secret page -->
<script type="text/javascript" src="/hobbycampus/js/httpRequest.js"></script>
<script type="text/javascript" src="/hobbycampus/js/admin.js"></script>