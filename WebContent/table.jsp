<%-- <%@page import="ekapp.UserCategory"%>
<%
	if (null == session.getAttribute("user") || null == session.getAttribute("category")){
		response.sendRedirect("login.jsp");
	}
	else 
		if((UserCategory) session.getAttribute("category") != UserCategory.ADMIN){
			response.sendRedirect("default.jsp");
		}
%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer"><div class="row"><div class="col-sm-6"><div class="dataTables_length" id="dataTables-example_length"><label>Show <select name="dataTables-example_length" aria-controls="dataTables-example" class="form-control input-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div></div><div class="col-sm-6"><div id="dataTables-example_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control input-sm" placeholder="" aria-controls="dataTables-example"></label></div></div></div><div class="row"><div class="col-sm-12"><table width="100%" class="table table-striped table-bordered table-hover dataTable no-footer dtr-inline" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info" style="width: 100%;">
                                <thead>
                                    <tr role="row"><th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending" style="width: 100px;">Rendering engine</th><th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 124px;">Browser</th><th class="sorting_desc" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 112px;" aria-sort="descending">Platform(s)</th><th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 85px;">Engine version</th><th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 61px;">CSS grade</th></tr>
                                </thead>
                                <tbody>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                <tr class="gradeC odd" role="row">
                                        <td class="">Misc</td>
                                        <td>IE Mobile</td>
                                        <td class="sorting_1">Windows Mobile 6</td>
                                        <td class="center">-</td>
                                        <td class="center">C</td>
                                    </tr><tr class="gradeA even" role="row">
                                        <td class="">Trident</td>
                                        <td>Internet Explorer 7</td>
                                        <td class="sorting_1">Win XP SP2+</td>
                                        <td class="center">7</td>
                                        <td class="center">A</td>
                                    </tr><tr class="gradeA odd" role="row">
                                        <td class="">Trident</td>
                                        <td>AOL browser (AOL desktop)</td>
                                        <td class="sorting_1">Win XP</td>
                                        <td class="center">6</td>
                                        <td class="center">A</td>
                                    </tr><tr class="gradeA even" role="row">
                                        <td class="">Gecko</td>
                                        <td>Netscape Browser 8</td>
                                        <td class="sorting_1">Win 98SE+</td>
                                        <td class="center">1.7</td>
                                        <td class="center">A</td>
                                    </tr><tr class="gradeA odd" role="row">
                                        <td class="">Gecko</td>
                                        <td>Firefox 1.0</td>
                                        <td class="sorting_1">Win 98+ / OSX.2+</td>
                                        <td class="center">1.7</td>
                                        <td class="center">A</td>
                                    </tr><tr class="gradeA even" role="row">
                                        <td class="">Gecko</td>
                                        <td>Firefox 1.5</td>
                                        <td class="sorting_1">Win 98+ / OSX.2+</td>
                                        <td class="center">1.8</td>
                                        <td class="center">A</td>
                                    </tr><tr class="gradeA odd" role="row">
                                        <td class="">Gecko</td>
                                        <td>Firefox 2.0</td>
                                        <td class="sorting_1">Win 98+ / OSX.2+</td>
                                        <td class="center">1.8</td>
                                        <td class="center">A</td>
                                    </tr><tr class="gradeA even" role="row">
                                        <td class="">Gecko</td>
                                        <td>Netscape Navigator 9</td>
                                        <td class="sorting_1">Win 98+ / OSX.2+</td>
                                        <td class="center">1.8</td>
                                        <td class="center">A</td>
                                    </tr><tr class="gradeA odd" role="row">
                                        <td class="">Gecko</td>
                                        <td>Seamonkey 1.1</td>
                                        <td class="sorting_1">Win 98+ / OSX.2+</td>
                                        <td class="center">1.8</td>
                                        <td class="center">A</td>
                                    </tr><tr class="gradeA even" role="row">
                                        <td class="">Gecko</td>
                                        <td>Mozilla 1.7</td>
                                        <td class="sorting_1">Win 98+ / OSX.1+</td>
                                        <td class="center">1.7</td>
                                        <td class="center">A</td>
                                    </tr></tbody>
                            </table></div></div><div class="row"><div class="col-sm-6"><div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div></div><div class="col-sm-6"><div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate"><ul class="pagination"><li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="#">Previous</a></li><li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="#">1</a></li><li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">2</a></li><li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">3</a></li><li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">4</a></li><li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">5</a></li><li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">6</a></li><li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="#">Next</a></li></ul></div></div></div></div>
                            <!-- /.table-responsive -->
                            <div class="well">
                                <h4>DataTables Usage Information</h4>
                                <p>DataTables is a very flexible, advanced tables plugin for jQuery. In SB Admin, we are using a specialized version of DataTables built for Bootstrap 3. We have also customized the table headings to use Font Awesome icons in place of images. For complete documentation on DataTables, visit their website at <a target="_blank" href="https://datatables.net/">https://datatables.net/</a>.</p>
                                <a class="btn btn-default btn-lg btn-block" target="_blank" href="https://datatables.net/">View DataTables Documentation</a>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
</body>
</html> --%>