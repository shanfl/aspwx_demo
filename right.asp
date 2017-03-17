<div class="moveright">
	<div class="mrwarp">
		<div class=""><strong>À¸Ä¿·ÖÀà</strong></div>
		<div class="mrtype">
			<ul>
            
                  <%
Set rsc = server.CreateObject("adodb.recordset")
sql = "select * from products_category_main"
rsc.Open sql, conn, 1, 3
Do While Not rsc.EOF
%>
  <LI> <a href="/show/list.asp?flid=<%=rsc("main_id")%>&sid=<%= sid %>"> <%=rsc("main_title")%> </A>  </LI>

	        <%
rsc.movenext
Loop
rsc.Close
Set rsc = Nothing
%>
				 
 	
				
			</ul>
		</div>
	</div>
</div>