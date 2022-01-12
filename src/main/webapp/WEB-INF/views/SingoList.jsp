<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="신고목록">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>SingoList</title>
    <link rel="stylesheet" href="resources/css/nicepage.css" media="screen">
<link rel="stylesheet" href="resources/css/SingoList.css" media="screen">
    <script class="u-script" type="text/javascript" src="resources/js/jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="resources/js/nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 4.2.6, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    
    
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "DailyShare",
		"logo": "images/default-logo.png"
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="SingoList">
    <meta property="og:description" content="">
    <meta property="og:type" content="website">
  </head>
  <body class="u-body"><header class="u-clearfix u-header u-sticky u-sticky-6560 u-white u-header" id="sec-bc2a"><div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-border-1 u-border-grey-15 u-line u-line-vertical u-line-1"></div>
        <div class="u-border-1 u-border-grey-15 u-line u-line-vertical u-line-2"></div>
        <div class="u-border-1 u-border-grey-15 u-line u-line-vertical u-line-3"></div>
        <a href="HomePage.html" data-page-id="342306138" class="u-image u-logo u-image-1" title="Home">
          <img src="resources/images/DailyShareLogo.PNG" class="u-logo-image u-logo-image-1">
        </a>
        <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
          <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px; font-weight: 700;">
            <a class="u-button-style u-custom-active-border-color u-custom-border u-custom-border-color u-custom-borders u-custom-hover-border-color u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-text-color u-custom-text-hover-color u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
              <svg viewBox="0 0 24 24"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
              <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><symbol id="menu-hamburger" viewBox="0 0 16 16" style="width: 16px; height: 16px;"><rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect>
</symbol>
</defs></svg>
            </a>
          </div>
          <div class="u-custom-menu u-nav-container">
            <ul class="u-nav u-spacing-20 u-unstyled u-nav-1"><li class="u-nav-item"><a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-grey-90 u-text-hover-palette-5-dark-2" href="피드.html" style="padding: 10px;">피드</a>
</li><li class="u-nav-item"><a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-grey-90 u-text-hover-palette-5-dark-2" href="포럼.html" style="padding: 10px;">포럼</a>
</li><li class="u-nav-item"><a class="u-border-active-palette-1-base u-border-hover-palette-1-base u-button-style u-nav-link u-text-active-palette-1-base u-text-grey-90 u-text-hover-palette-5-dark-2" href="MY블로그.html" style="padding: 10px;">MY블로그</a>
</li></ul>
          </div>
          <div class="u-custom-menu u-nav-container-collapse">
            <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
              <div class="u-inner-container-layout u-sidenav-overflow">
                <div class="u-menu-close"></div>
                <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2"><li class="u-nav-item"><a class="u-button-style u-nav-link" href="피드.html" style="padding: 10px;">피드</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="포럼.html" style="padding: 10px;">포럼</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="MY블로그.html" style="padding: 10px;">MY블로그</a>
</li></ul>
              </div>
            </div>
            <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
          </div>
        </nav>
        <a href="https://nicepage.online" class="u-border-none u-btn u-btn-round u-button-style u-grey-70 u-hover-custom-color-1 u-radius-50 u-btn-1">글쓰기</a>
        <a href="https://nicepage.com/c/pricing-html-templates" class="u-border-1 u-border-hover-grey-80 u-btn u-button-style u-none u-text-grey-80 u-btn-2">Hyeonsun</a>
        <a href="https://nicepage.com/static-site-generator" class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-btn u-button-style u-none u-text-palette-5-dark-3 u-btn-3">[스킨] 티에디션, 테터데스크가 종료됩니다.</a><span class="u-file-icon u-icon u-text-grey-75 u-icon-1"><img src="resources/images/2.png" alt=""></span><span class="u-file-icon u-icon u-text-grey-75 u-icon-2"><img src="resources/images/3.png" alt=""></span><span class="u-file-icon u-icon u-icon-circle u-text-grey-60 u-icon-3"><img src="resources/images/4.png" alt=""></span>
      </div><style class="u-sticky-style" data-style-id="6560">.u-sticky-fixed.u-sticky-6560:before, .u-body.u-sticky-fixed .u-sticky-6560:before {
borders: top right bottom left !important
}</style></header> 
    <section class="u-clearfix u-section-1" id="sec-3758">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-container-style u-group u-group-1">
          <div class="u-container-layout">
            <h4 class="u-text u-text-default u-text-1">블로그 이름</h4>
            <p class="u-text u-text-default u-text-2">회원 url</p>
            <a href="https://nicepage.cloud" class="u-black u-border-none u-btn u-button-style u-hover-grey-15 u-btn-1">게시글 쓰기</a>
          </div>
        </div>
        <div class="u-align-center u-border-3 u-border-grey-dark-1 u-line u-line-horizontal u-line-1"></div>
        <div class="u-tab-links-align-right u-tabs u-tabs-1">
          <ul class="u-tab-list u-unstyled" role="tablist">
            <li class="u-tab-item" role="presentation">
              <a class="active u-button-style u-tab-link" id="link-tab-4217" href="#tab-4217" role="tab" aria-controls="tab-4217" aria-selected="true">접수된신고</a>
            </li>
            <li class="u-tab-item" role="presentation">
              <a class="u-button-style u-tab-link" id="link-tab-4913" href="#tab-4913" role="tab" aria-controls="tab-4913" aria-selected="false">처리된신고</a>
            </li>
            <li class="u-tab-item" role="presentation">
              <a class="u-button-style u-tab-link" id="link-tab-7f05" href="#tab-7f05" role="tab" aria-controls="tab-7f05" aria-selected="false">항목관리</a>
            </li>
          </ul>
          <div class="u-tab-content">
            <div class="u-container-style u-tab-active u-tab-pane" id="tab-4217" role="tabpanel" aria-labelledby="link-tab-4217">
              <div class="u-container-layout u-container-layout-2">
                <div class="u-form u-form-1">
                  <form action="#" method="POST" class="u-clearfix u-form-horizontal u-form-spacing-10 u-inner-form" source="custom" name="form" style="padding: 10px;">
                    <div class="u-form-group u-form-select u-form-group-1">
                      <label for="select-103e" class="u-form-control-hidden u-label"></label>
                      <div class="u-form-select-wrapper">
                        <select id="select-103e" name="select" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white">
                          <option value="전체">전체</option>
                          <option value="신고자아이디">신고자아이디</option>
                          <option value="신고된아이디">신고된아이디</option>
                          <option value="신고항목">신고항목</option>
                        </select>
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="12" version="1" class="u-caret"><path fill="currentColor" d="M4 8L0 4h8z"></path></svg>
                      </div>
                    </div>
                    <div class="u-form-group u-form-name">
                      <label for="name-4ab8" class="u-form-control-hidden u-label"></label>
                      <input type="text" placeholder="search" id="name-4ab8" name="name" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="">
                    </div>
                    <div class="u-align-left u-form-group u-form-submit">
                      <a href="#" class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-btn u-btn-submit u-button-style u-none u-text-palette-1-base u-btn-2">검색</a>
                      <input type="submit" value="submit" class="u-form-control-hidden">
                    </div>
                    <div class="u-form-send-message u-form-send-success"> Thank you! Your message has been sent. </div>
                    <div class="u-form-send-error u-form-send-message"> Unable to send your message. Please fix errors then try again. </div>
                    <input type="hidden" value="" name="recaptchaResponse">
                  </form>
                </div>
                <div class="u-table u-table-responsive u-table-1">
                  <table class="u-table-entity">
                    <colgroup>
                      <col width="12.14%">
                      <col width="16.8%">
                      <col width="18.09%">
                      <col width="18.09%">
                      <col width="18.09%">
                      <col width="16.8%">
                    </colgroup>
                    <thead class="u-align-center u-black u-table-header u-table-header-1">
                      <tr style="height: 77px;">
                        <th class="u-border-1 u-border-black u-table-cell u-table-cell-1">신고번호</th>
                        <th class="u-border-1 u-border-black u-table-cell u-table-cell-2">신고자아이디</th>
                        <th class="u-border-1 u-border-black u-table-cell">신고된아이디</th>
                        <th class="u-border-1 u-border-black u-table-cell">신고항목</th>
                        <th class="u-border-1 u-border-black u-table-cell">신고한날짜</th>
                        <th class="u-border-1 u-border-black u-table-cell">신고내용</th>
                      </tr>
                    </thead>
                    <tbody class="u-table-body">
                      <tr style="height: 80px;">
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-7"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-8"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-9"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-10"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-11"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-12"></td>
                      </tr>
                      <tr style="height: 80px;">
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-13"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-14"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-15"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-16"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-17"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-18"></td>
                      </tr>
                      <tr style="height: 80px;">
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-19"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-20"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-21"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-22"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-23"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-24"></td>
                      </tr>
                      <tr style="height: 80px;">
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-25"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-26"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-27"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-28"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-29"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-30"></td>
                      </tr>
                      <tr style="height: 80px;">
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-31"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-32"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-33"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-34"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-35"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-36"></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="u-container-style u-tab-pane" id="tab-4913" role="tabpanel" aria-labelledby="link-tab-4913">
              <div class="u-container-layout u-valign-bottom u-container-layout-3">
                <div class="u-form u-form-2">
                  <form action="#" method="POST" class="u-clearfix u-form-horizontal u-form-spacing-10 u-inner-form" source="custom" name="form" style="padding: 10px;">
                    <div class="u-form-group u-form-select u-form-group-4">
                      <label for="select-103e" class="u-form-control-hidden u-label"></label>
                      <div class="u-form-select-wrapper">
                        <select id="select-103e" name="select" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white">
                          <option value="전체">전체</option>
                          <option value="신고자아이디">신고자아이디</option>
                          <option value="신고된아이디">신고된아이디</option>
                          <option value="신고항목">신고항목</option>
                        </select>
                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="12" version="1" class="u-caret"><path fill="currentColor" d="M4 8L0 4h8z"></path></svg>
                      </div>
                    </div>
                    <div class="u-form-group u-form-name">
                      <label for="name-4ab8" class="u-form-control-hidden u-label"></label>
                      <input type="text" placeholder="search" id="name-4ab8" name="name" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="">
                    </div>
                    <div class="u-align-left u-form-group u-form-submit">
                      <a href="#" class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-btn u-btn-submit u-button-style u-none u-text-palette-1-base u-btn-3">검색</a>
                      <input type="submit" value="submit" class="u-form-control-hidden">
                    </div>
                    <div class="u-form-send-message u-form-send-success"> Thank you! Your message has been sent. </div>
                    <div class="u-form-send-error u-form-send-message"> Unable to send your message. Please fix errors then try again. </div>
                    <input type="hidden" value="" name="recaptchaResponse">
                  </form>
                </div>
                <div class="u-table u-table-responsive u-table-2">
                  <table class="u-table-entity">
                    <colgroup>
                      <col width="13.1%">
                      <col width="11.4%">
                      <col width="15.5%">
                      <col width="15.5%">
                      <col width="15.5%">
                      <col width="14.2%">
                      <col width="14.8%">
                    </colgroup>
                    <thead class="u-align-center u-black u-table-header u-table-header-2">
                      <tr style="height: 77px;">
                        <th class="u-border-1 u-border-black u-table-cell u-table-cell-37">신고<br>번호
                        </th>
                        <th class="u-border-1 u-border-black u-table-cell u-table-cell-38">신고자<br>아이디
                        </th>
                        <th class="u-border-1 u-border-black u-table-cell">신고된아이디</th>
                        <th class="u-border-1 u-border-black u-table-cell">신고항목</th>
                        <th class="u-border-1 u-border-black u-table-cell">처리날짜</th>
                        <th class="u-border-1 u-border-black u-table-cell">처리내용</th>
                        <th class="u-border-1 u-border-black u-table-cell">처리자</th>
                      </tr>
                    </thead>
                    <tbody class="u-align-left u-table-body">
                      <tr style="height: 80px;">
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-44"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-45"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-46"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-47"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-48"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-49"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-50"></td>
                      </tr>
                      <tr style="height: 80px;">
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-51"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-52"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-53"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-54"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-55"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-56"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-57"></td>
                      </tr>
                      <tr style="height: 80px;">
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-58"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-59"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-60"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-61"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-62"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-63"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-64"></td>
                      </tr>
                      <tr style="height: 80px;">
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-65"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-66"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-67"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-68"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-69"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-70"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-71"></td>
                      </tr>
                      <tr style="height: 80px;">
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-72"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-73"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-74"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-75"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-76"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-77"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-78"></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="u-align-right u-container-style u-tab-pane" id="tab-7f05" role="tabpanel" aria-labelledby="link-tab-7f05">
              <div class="u-container-layout u-valign-bottom u-container-layout-4">
                <div class="u-form u-form-3">
                  <form action="#" method="POST" class="u-clearfix u-form-horizontal u-form-spacing-10 u-inner-form" source="custom" name="form-1" style="padding: 10px;">
                    <div class="u-form-group u-form-name">
                      <label for="name-cb9e" class="u-form-control-hidden u-label"></label>
                      <input type="text" placeholder="새로 등록할 항목" id="name-cb9e" name="name" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required="">
                    </div>
                    <div class="u-align-left u-form-group u-form-submit">
                      <a href="#" class="u-black u-border-none u-btn u-btn-round u-btn-submit u-button-style u-radius-5 u-btn-4">등록<br>
                      </a>
                      <input type="submit" value="submit" class="u-form-control-hidden">
                    </div>
                    <div class="u-form-send-message u-form-send-success"> Thank you! Your message has been sent. </div>
                    <div class="u-form-send-error u-form-send-message"> Unable to send your message. Please fix errors then try again. </div>
                    <input type="hidden" value="" name="recaptchaResponse">
                  </form>
                </div>
                <div class="u-expanded-width u-table u-table-responsive u-table-3">
                  <table class="u-table-entity">
                    <colgroup>
                      <col width="15.7%">
                      <col width="35.4%">
                      <col width="15.5%">
                      <col width="33.4%">
                    </colgroup>
                    <thead class="u-align-center u-black u-table-header u-table-header-3">
                      <tr style="height: 77px;">
                        <th class="u-border-1 u-border-black u-table-cell u-table-cell-79">코드</th>
                        <th class="u-border-1 u-border-black u-table-cell u-table-cell-80">신고항목</th>
                        <th class="u-border-1 u-border-black u-table-cell">사용여부</th>
                        <th class="u-border-1 u-border-black u-table-cell"></th>
                      </tr>
                    </thead>
                    <tbody class="u-table-body">
                      <tr style="height: 80px;">
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-83"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-84"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-85"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-86"></td>
                      </tr>
                      <tr style="height: 80px;">
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-87"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-88"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-89"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-90"></td>
                      </tr>
                      <tr style="height: 80px;">
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-91"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-92"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-93"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-94"></td>
                      </tr>
                      <tr style="height: 80px;">
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-95"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-96"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-97"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-98"></td>
                      </tr>
                      <tr style="height: 80px;">
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-99"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-100"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-101"></td>
                        <td class="u-border-3 u-border-grey-30 u-table-cell u-table-cell-102"></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <h2 class="u-align-left u-text u-text-default u-text-3">신고목록</h2>
        <a href="#sec-c8c2" class="u-btn u-button-style u-dialog-link u-hover-palette-1-dark-1 u-palette-1-base u-btn-5">신고내용</a>
        <a href="#sec-eebf" class="u-btn u-button-style u-dialog-link u-hover-palette-1-dark-1 u-palette-1-base u-btn-6">처리내역</a>
        <div class="u-list u-list-1">
          <div class="u-repeater u-repeater-1">
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-valign-bottom u-container-layout-5">
                <h5 class="u-text u-text-default u-text-4">회원목록</h5>
              </div>
            </div>
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-valign-bottom u-container-layout-6">
                <h5 class="u-text u-text-default u-text-5">신고목록</h5>
              </div>
            </div>
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-valign-bottom u-container-layout-7">
                <h5 class="u-text u-text-default u-text-6">제재목록</h5>
              </div>
            </div>
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-valign-bottom u-container-layout-8">
                <h5 class="u-text u-text-default u-text-7">관리자목록</h5>
              </div>
            </div>
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-valign-bottom u-container-layout-9">
                <h5 class="u-text u-text-default u-text-8">카테고리목록</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    
    
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-1480"><div class="u-clearfix u-sheet u-sheet-1">
        <h4 class="u-text u-text-default u-text-1">DS</h4>
        <p class="u-align-left u-text u-text-default u-text-2">Daily Share<br>오늘을 공유하다.<br>02-898-0000<br>서울특별시 금천구 가산동
        </p>
      </div></footer>
    <section class="u-backlink u-clearfix u-grey-80">
      <a class="u-link" href="https://nicepage.com/html5-template" target="_blank">
        <span>HTML5 Templates</span>
      </a>
      <p class="u-text">
        <span>created with</span>
      </p>
      <a class="u-link" href="" target="_blank">
        <span>Website Builder Software</span>
      </a>. 
    </section>
  <section class="u-align-center u-black u-clearfix u-container-style u-dialog-block u-opacity u-opacity-70 u-section-5" id="sec-c8c2">
      <div class="u-container-style u-dialog u-grey-15 u-dialog-1">
        <div class="u-container-layout u-container-layout-1">
          <h2 class="u-align-center u-text u-text-default u-text-1">신고 내용</h2>
          <p class="u-align-center u-text u-text-default u-text-2">작성자</p>
          <p class="u-align-center u-text u-text-default u-text-3">cyw4328</p>
          <p class="u-align-center u-text u-text-default u-text-4">내용</p>
          <p class="u-align-left u-text u-text-5">Sample text. Click to select the text box. Click again or double click to start editingthe text.</p>
          <a href="https://nicepage.dev" class="u-active-none u-border-2 u-border-active-palette-2-dark-1 u-border-hover-palette-2-base u-border-palette-1-base u-btn u-button-style u-hover-none u-none u-text-hover-palette-2-base u-text-palette-1-base u-btn-1">더보기</a>
          <p class="u-align-center u-text u-text-default u-text-6">신고항목</p>
          <p class="u-align-center u-text u-text-default u-text-7">욕설</p>
          <div class="u-form u-form-1">
            <form action="#" method="POST" class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form" source="custom" name="form-1" style="padding: 10px;">
              <div class="u-form-group u-form-message">
                <label for="message-2880" class="u-form-control-hidden u-label"></label>
                <textarea placeholder="Enter your message" rows="4" cols="50" id="message-2880" name="message" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white" required=""></textarea>
              </div>
              <div class="u-align-right u-form-group u-form-submit">
                <a href="#" class="u-black u-border-none u-btn u-btn-submit u-button-style u-hover-grey-25 u-btn-2">확인</a>
                <input type="submit" value="submit" class="u-form-control-hidden">
              </div>
              <div class="u-form-send-message u-form-send-success"> Thank you! Your message has been sent. </div>
              <div class="u-form-send-error u-form-send-message"> Unable to send your message. Please fix errors then try again. </div>
              <input type="hidden" value="" name="recaptchaResponse">
            </form>
          </div>
          <p class="u-align-center u-text u-text-default u-text-8">처리내용</p>
        </div><button class="u-dialog-close-button u-icon u-text-grey-50 u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 413.348 413.348" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-5801"></use></svg><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" xml:space="preserve" class="u-svg-content" viewBox="0 0 413.348 413.348" id="svg-5801"><path d="m413.348 24.354-24.354-24.354-182.32 182.32-182.32-182.32-24.354 24.354 182.32 182.32-182.32 182.32 24.354 24.354 182.32-182.32 182.32 182.32 24.354-24.354-182.32-182.32z"></path></svg></button>
      </div>
    </section><style> .u-section-5 {
  min-height: 866px;
}

.u-section-5 .u-dialog-1 {
  width: 534px;
  min-height: 625px;
  margin: 99px calc(((100% - 1140px) / 2) + 287px) 60px auto;
}

.u-section-5 .u-container-layout-1 {
  padding: 40px 0;
}

.u-section-5 .u-text-1 {
  margin: 0 auto 0 162px;
}

.u-section-5 .u-text-2 {
  font-weight: 700;
  font-size: 1.125rem;
  margin: 54px auto 0 71px;
}

.u-section-5 .u-text-3 {
  margin: -27px auto 0 158px;
}

.u-section-5 .u-text-4 {
  font-weight: 700;
  font-size: 1.125rem;
  text-align: center;
  margin: 18px auto 0 71px;
}

.u-section-5 .u-text-5 {
  margin: -29px 71px 0 157px;
}

.u-section-5 .u-btn-1 {
  border-style: none none solid;
  margin: 0 auto 0 189px;
  padding: 0;
}

.u-section-5 .u-text-6 {
  font-weight: 700;
  font-size: 1.125rem;
  text-align: center;
  margin: 15px auto 0 71px;
}

.u-section-5 .u-text-7 {
  text-align: center;
  margin: -27px auto 0 191px;
}

.u-section-5 .u-form-1 {
  height: 202px;
  margin: 26px 88px 0 178px;
}

.u-section-5 .u-btn-2 {
  background-image: none;
  border-style: none;
}

.u-section-5 .u-text-8 {
  font-weight: 700;
  font-size: 1.125rem;
  text-align: center;
  margin: -193px auto 0 71px;
}

.u-section-5 .u-icon-1 {
  width: 15px;
  height: 15px;
  left: auto;
  top: 17px;
  position: absolute;
  right: 16px;
}

@media (max-width: 1199px) {
  .u-section-5 .u-dialog-1 {
    margin-right: calc(((100% - 940px) / 2) + 287px);
    height: auto;
  }

  .u-section-5 .u-text-1 {
    margin-left: 162px;
  }

  .u-section-5 .u-text-2 {
    margin-left: 71px;
  }

  .u-section-5 .u-text-3 {
    margin-top: -27px;
    margin-left: 158px;
  }

  .u-section-5 .u-text-4 {
    margin-left: 71px;
  }

  .u-section-5 .u-text-5 {
    margin-top: -29px;
    margin-right: 71px;
    margin-left: 157px;
  }

  .u-section-5 .u-btn-1 {
    margin-left: 189px;
  }

  .u-section-5 .u-text-6 {
    margin-left: 71px;
  }

  .u-section-5 .u-text-7 {
    margin-top: -27px;
    margin-left: 191px;
  }

  .u-section-5 .u-form-1 {
    margin-right: 88px;
    margin-left: 178px;
  }

  .u-section-5 .u-text-8 {
    margin-top: -193px;
    margin-left: 71px;
  }
}

@media (max-width: 991px) {
  .u-section-5 .u-dialog-1 {
    margin-right: calc(((100% - 720px) / 2) + 186px);
  }

  .u-section-5 .u-container-layout-1 {
    padding-bottom: 30px;
  }
}

@media (max-width: 767px) {
  .u-section-5 .u-dialog-1 {
    margin-right: calc(((100% - 540px) / 2) + 6px);
  }

  .u-section-5 .u-container-layout-1 {
    padding-top: 30px;
    padding-left: 40px;
    padding-right: 40px;
  }

  .u-section-5 .u-text-5 {
    margin-top: -23px;
    margin-left: 205px;
  }

  .u-section-5 .u-btn-1 {
    margin-top: -17px;
    margin-left: 191px;
  }

  .u-section-5 .u-text-6 {
    margin-top: 31px;
  }

  .u-section-5 .u-text-7 {
    margin-top: 10px;
  }

  .u-section-5 .u-form-1 {
    margin-top: -8px;
  }

  .u-section-5 .u-text-8 {
    margin-top: -166px;
  }
}

@media (max-width: 575px) {
  .u-section-5 .u-dialog-1 {
    width: 340px;
    margin-right: calc(((100% - 340px) / 2));
  }

  .u-section-5 .u-container-layout-1 {
    padding-top: 40px;
    padding-left: 25px;
    padding-right: 25px;
  }

  .u-section-5 .u-text-1 {
    margin-top: -260px;
    margin-left: 103px;
  }

  .u-section-5 .u-text-2 {
    margin-top: 115px;
  }

  .u-section-5 .u-text-3 {
    margin-top: 339px;
    margin-left: 101px;
  }

  .u-section-5 .u-text-4 {
    margin-top: -389px;
  }

  .u-section-5 .u-text-5 {
    margin-top: 371px;
    margin-right: 0;
    margin-left: 35px;
  }

  .u-section-5 .u-btn-1 {
    margin-top: -8px;
    margin-left: 0;
  }

  .u-section-5 .u-text-6 {
    margin-top: -213px;
  }

  .u-section-5 .u-text-7 {
    margin-top: 191px;
    margin-left: 122px;
  }

  .u-section-5 .u-form-1 {
    margin-top: -33px;
    margin-right: 0;
    margin-left: 72px;
  }
}</style><section class="u-align-center u-black u-clearfix u-container-style u-dialog-block u-opacity u-opacity-70 u-section-6" id="sec-eebf">
      <div class="u-container-style u-dialog u-grey-10 u-dialog-1">
        <div class="u-container-layout u-container-layout-1">
          <h2 class="u-align-center u-text u-text-default u-text-1">처리내용</h2>
          <p class="u-align-center u-text u-text-default u-text-2">작성자</p>
          <p class="u-align-center u-text u-text-default u-text-3">cyw4328</p>
          <p class="u-align-center u-text u-text-default u-text-4">내용</p>
          <p class="u-align-left u-text u-text-default u-text-5">asfdgsafdhhdafdhdahfdahsfhashfsh<br>sadhdahsdhaasdh<br>sadhdhsahdsahsadhsahdsahdh<br>
          </p>
          <a href="https://nicepage.com/html-website-builder" class="u-active-none u-border-2 u-border-active-palette-2-dark-1 u-border-hover-palette-2-base u-border-palette-1-base u-btn u-button-style u-hover-none u-none u-text-hover-palette-2-base u-text-palette-1-base u-btn-1">더보기</a>
          <p class="u-align-center u-text u-text-default u-text-6">신고항목</p>
          <p class="u-align-left u-text u-text-7">욕설</p>
          <p class="u-align-center u-text u-text-default u-text-8">처리내용</p>
          <p class="u-align-left u-text u-text-9">댓글 작성 제한 처리</p>
        </div><button class="u-dialog-close-button u-icon u-text-grey-50 u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 413.348 413.348" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-5801"></use></svg><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" xml:space="preserve" class="u-svg-content" viewBox="0 0 413.348 413.348" id="svg-5801"><path d="m413.348 24.354-24.354-24.354-182.32 182.32-182.32-182.32-24.354 24.354 182.32 182.32-182.32 182.32 24.354 24.354 182.32-182.32 182.32 182.32 24.354-24.354-182.32-182.32z"></path></svg></button>
      </div>
      <a href="https://nicepage.com/k/quiz-html-templates" class="u-black u-border-none u-btn u-button-style u-hover-grey-25 u-btn-2">확인</a>
    </section><style> .u-section-6 {
  min-height: 866px;
}

.u-section-6 .u-dialog-1 {
  width: 566px;
  height: auto;
  min-height: 565px;
  margin: 60px auto 0;
}

.u-section-6 .u-container-layout-1 {
  padding: 40px 0;
}

.u-section-6 .u-text-1 {
  font-size: 2.5rem;
  text-transform: uppercase;
  letter-spacing: 2px;
  margin: 0 auto;
}

.u-section-6 .u-text-2 {
  font-weight: 700;
  font-size: 1.125rem;
  margin: 49px auto 0 101px;
}

.u-section-6 .u-text-3 {
  margin: -29px auto 0 215px;
}

.u-section-6 .u-text-4 {
  font-weight: 700;
  font-size: 1.125rem;
  text-align: center;
  margin: 23px auto 0 101px;
}

.u-section-6 .u-text-5 {
  text-align: center;
  margin: -29px 80px 0 auto;
}

.u-section-6 .u-btn-1 {
  border-style: none none solid;
  margin: 0 auto 0 215px;
  padding: 0;
}

.u-section-6 .u-text-6 {
  font-weight: 700;
  font-size: 1.125rem;
  text-align: center;
  margin: 21px auto 0 101px;
}

.u-section-6 .u-text-7 {
  margin: -26px 163px 0 215px;
}

.u-section-6 .u-text-8 {
  font-weight: 700;
  font-size: 1.125rem;
  text-align: center;
  margin: 42px auto 0 101px;
}

.u-section-6 .u-text-9 {
  text-align: left;
  margin: -29px 163px 0 215px;
}

.u-section-6 .u-icon-1 {
  width: 15px;
  height: 15px;
  left: auto;
  top: 17px;
  position: absolute;
  right: 16px;
}

.u-section-6 .u-btn-2 {
  border-style: none;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 1px;
  width: 133px;
  background-image: none;
  margin: -88px calc(((100% - 1140px) / 2) + 367px) 60px auto;
}

@media (max-width: 1199px) {
  .u-section-6 .u-text-3 {
    margin-left: 215px;
    margin-top: -29px;
  }

  .u-section-6 .u-text-5 {
    margin-top: -29px;
    margin-right: 80px;
  }

  .u-section-6 .u-btn-1 {
    margin-left: 215px;
  }

  .u-section-6 .u-text-7 {
    margin-top: -26px;
    margin-right: 163px;
    margin-left: 215px;
  }

  .u-section-6 .u-text-9 {
    margin-top: -29px;
    margin-right: 163px;
    margin-left: 215px;
  }

  .u-section-6 .u-btn-2 {
    margin-top: -88px;
    margin-right: calc(((100% - 940px) / 2) + 367px);
  }
}

@media (max-width: 991px) {
  .u-section-6 .u-container-layout-1 {
    padding-bottom: 30px;
  }

  .u-section-6 .u-btn-2 {
    margin-right: calc(((100% - 720px) / 2) + 367px);
  }
}

@media (max-width: 767px) {
  .u-section-6 .u-dialog-1 {
    width: 540px;
  }

  .u-section-6 .u-container-layout-1 {
    padding-top: 30px;
    padding-left: 40px;
    padding-right: 40px;
  }

  .u-section-6 .u-text-3 {
    margin-left: 205px;
  }

  .u-section-6 .u-btn-1 {
    margin-left: 189px;
  }

  .u-section-6 .u-text-7 {
    margin-right: -67px;
    margin-left: 202px;
  }

  .u-section-6 .u-text-9 {
    margin-right: 150px;
    margin-left: 202px;
  }

  .u-section-6 .u-btn-2 {
    margin-right: calc(((100% - 540px) / 2) + 367px);
  }
}

@media (max-width: 575px) {
  .u-section-6 .u-dialog-1 {
    width: 340px;
  }

  .u-section-6 .u-container-layout-1 {
    padding-top: 40px;
    padding-left: 25px;
    padding-right: 25px;
  }

  .u-section-6 .u-text-1 {
    font-size: 2.125rem;
  }

  .u-section-6 .u-text-3 {
    margin-left: 129px;
  }

  .u-section-6 .u-btn-1 {
    margin-left: 0;
  }

  .u-section-6 .u-text-7 {
    margin-left: 102px;
  }

  .u-section-6 .u-text-9 {
    margin-right: 50px;
    margin-left: 102px;
  }

  .u-section-6 .u-btn-2 {
    margin-right: calc(((100% - 340px) / 2) + 207px);
  }
}</style></body>
</html>