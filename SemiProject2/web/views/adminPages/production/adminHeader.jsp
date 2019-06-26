<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
           
            <div class="navbar nav_title" style="border: 0;">
              <a href="/semi/memberSelect.admin" class="site_title"><i class="fa fa-money"></i><span>TMI Corporation</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>환영합니다,</span>
                <h2>관리자님</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>MENU</h3>
                <ul class="nav side-menu">
                  <li><a href="/semi/memberSelect.admin"><i class="fa fa-users"></i>회원 관리 </a></li>
                  
                  <li><a><i class="fa fa-desktop"></i> 서비스 관리<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/semi/serviceList.admin">판매 서비스 관리</a></li>
                      <li><a href="adManage.jsp">광고 관리</a></li>
                    </ul>
                  </li>
                  
                  <li><a href="/semi/requestList.admin"><i class="fa fa-comment"></i> 1:1 문의</a>
                  
                  </li>
                  <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="tables.html">Tables</a></li>
                      <li><a href="tables_dynamic.html">Table Dynamic</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i>통계<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="chartjs.html">Chart JS</a></li>
                      <li><a href="chartjs2.html">Chart JS2</a></li>
                      <li><a href="morisjs.html">Moris JS</a></li>
                      <li><a href="echarts.html">ECharts</a></li>
                      <li><a href="other_charts.html">Other Charts</a></li>
                    </ul>
                  </li>
                  </ul>
              </div>
              
            
            </div>
            <!-- /sidebar menu -->


     
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav" style="margin-bottom:5px;">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle" style="margin-bottom:7px;">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

            </nav>
          </div>
        </div>
      	
      
        <!-- /top navigation -->
