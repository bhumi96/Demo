<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crudOperation.aspx.cs" Inherits="CRUD1.crudOperation" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

     <link rel="stylesheet" href="https://cdn.datatables.net/1.11.0/css/dataTables.bootstrap4.min.css" />
    <link href="registration.css" rel="stylesheet" />
    <script src="https://cdn.datatables.net/1.11.0/js/jquery.dataTables.min.js"></script>
     <script src="https://cdn.datatables.net/1.11.0/js/dataTables.bootstrap4.min.js"></script>
     
    <title></title>

    <script>

        $(document).ready(function () {
            $('#studentdetail').DataTable();
        });

    </script>
    <style>
        .panel > .panel-heading{
            background-color:#46B2B2;
            color:white;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="wrapper rounded bg-white">
    <div class="h3">Registration Form</div>
    <div class="form">
        <asp:label ID="lblId" Visible="false" Text="Id" runat="server" ></asp:label>
        <div class="row">
            <div class="col-md-6 mt-md-0 mt-3">
                <label>First Name</label> 
                <input type="text" class="form-control" id="txtfname" runat="server"/> 
            </div>
            <div class="col-md-6 mt-md-0 mt-3"> 
                <label>Last Name</label> 
                <input type="text" class="form-control" id="txtlname" runat="server"/> 
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mt-md-0 mt-3">
                <label>Birthday</label> 
                <input type="date" class="form-control" id="dob" runat="server"/> 
            </div>
            <div class="col-md-6 mt-md-0 mt-3"> 
                <label>Gender</label>
                <div class="d-flex align-items-center mt-2">
                    <label class="option"> <input type="radio" name="radio" id="chkmale" runat="server" value="male"/>Male <span class="checkmark"></span> </label>
                    <label class="option ms-4"> <input type="radio" name="radio" id="chkfemale" runat="server" value="female"/>Female <span class="checkmark"></span> </label> 
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mt-md-0 mt-3"> 
                <label>Email</label> 
                <input type="email" class="form-control" id="txtmail" runat="server"/> 
            </div>
            <div class="col-md-6 mt-md-0 mt-3">
                <label>Phone Number</label> 
                <input type="number" class="form-control" id="txtmno" runat="server"/>
            </div>
        </div>
        <div class=" my-md-2 my-3"> 
                <label>Subject</label> <select id="sub" runat="server">
                <option>Choose Option</option>
                <option value="Maths">Maths</option>
                <option value="Science">Science</option>
                <option value="Social">Social</option>
                <option value="Hindi">Hindi</option>
            </select>
        </div>
        <%--<div class="btn btn-primary mt-3">Submit</div>--%>

        <%--<button type="button" id="btnReg" class="btn btn-primary" onclick="btnReg_Click()"></button>--%>
        <asp:Button runat="server" ID="btnReg" CssClass="btn btn-primary" OnClick="btnReg_Click" Text="SUBMIT" />
         <asp:Button runat="server" ID="btnUpdate" CssClass="btn btn-success" OnClick="btnUpdate_Click" Text="UPDATE" />
         <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-danger" OnClick="btnDelete_Click" Text="DELETE" />
    </div>
</div>
        </div>


        <div>
               <div class="panel" style="width:100%">
            <div class="panel-heading" style="font-weight:bold;font-family:'Times New Roman', Times, serif;height:50px;margin-bottom:20px;" >
                 <h4 class="panel-title">
                    
                </h4>
            </div>
            <div class="panel-body">
            <asp:HiddenField ID="hidfield" runat="server" />   
            <asp:Repeater ID="rptstudentdetail" runat="server">
                <HeaderTemplate>
                    <table class="table table-striped table-bordered" role="grid" id="studentdetail" aria-describedby="emails_info">
                     <thead>
                          <tr>
                             <th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label=" ID
                               : activate to sort column ascending">ID</th>
                             <th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label=" FIRST_NAME
                               : activate to sort column ascending">FIRST_NAME</th>
                             <th id="tdemail" style="width:200px" class="sorting" tabindex="0" rowspan="1" colspan="1" aria-label=" LAST_NAME
                               : activate to sort column ascending">LAST_NAME</th>
                             <th style="width:100px" class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label=" DATE_OF_BIRTH
                               : activate to sort column ascending">DATE OF BIRTH</th>
                              <th style="width:100px" class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label=" GENDER
                               : activate to sort column ascending">GENDER</th>
                             <th style="width:100px" class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label=" EMAIL
                               : activate to sort column ascending">EMAIL</th>
                             <th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label=" PHONE-NUMBER
                               : activate to sort column ascending">PHONE-NUMBER</th>
                             <th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label=" SUBJECT
                               : activate to sort column ascending">SUBJECT</th>
                              <th class="sorting" tabindex="0"  rowspan="1" colspan="1" aria-label=" ACTION
                               : activate to sort column ascending">SELECT</th>
                            
                           </tr>
                    </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                     <tr>
                                      <td>
                                           <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                       </td>
                                       
                                       <td><%# DataBinder.Eval(Container.DataItem,"first_name") %></td>
                                       <td><%# DataBinder.Eval(Container.DataItem,"last_name") %></td>
                                       <td><%# DataBinder.Eval(Container.DataItem,"dob") %></td>
                                       <td id="txtgender"><%# DataBinder.Eval(Container.DataItem,"gender") %></td>
                                       <td><%# DataBinder.Eval(Container.DataItem,"email") %></td>
                                       <td><%# DataBinder.Eval(Container.DataItem,"phone_number") %></td>
                                       <td><%# DataBinder.Eval(Container.DataItem,"subject") %></td>

                                      <td>
                                           <asp:Button ID="btnselect" runat="server" Text="SELECT"  CssClass="btn btn-primary" OnClick="btnselect_Click"/>
                                       </td>
                      </tr>

                </ItemTemplate>
                <FooterTemplate>
                     </tbody>
               
               </table>
                </FooterTemplate>
                  
            </asp:Repeater>
                <asp:HiddenField ID="hidfield1" runat="server" />

            </div>
        </div>
        </div>

    </form>

   <script type="text/javascript">
       $(('#btnselect').click = function () {
           $("[id*= studentdetail] td").click(function () {
               var row = $(this).parent();
               $("[id*=studentdetail] tr").each(function () {
                   if ($(this)[0] != row[0]) {
                       $("td", this).removeClass("selected_row");
                   }
               });
               $("td", row).each(function () {
                   if (!$(this).hasClass("selected_row")) {
                       $(this).addClass("selected_row");
                   } else {
                       $(this).removeClass("selected_row");
                   }
               });
               $('[id*=hidfield]').val($(this).closest('tr').find('[id*=lblid]')[0].innerHTML);
               console.log(lblid);
               return true;
           });
       });
   </script>
    
    
</body>
</html>
