<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipal.master" AutoEventWireup="true" CodeFile="Productos.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <table width="100%" border="0">
            
            <tr>
                

                <!-- Aqui va td -->
                <td colspan="2" align="middle" bgcolor="brown" class="auto-style1">
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" PostBackUrl="~/Acceso.aspx" ForeColor="#FFFFCC">Cerrar sesión</asp:LinkButton>
&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" PostBackUrl="~/Productos.aspx" ForeColor="#FFFFCC">Productos</asp:LinkButton>
&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton3" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" PostBackUrl="~/edProductos.aspx" ForeColor="#FFFFCC">Editar Productos</asp:LinkButton>
&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton4" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" PostBackUrl="~/Usuarios.aspx" ForeColor="#FFFFCC">Usuarios</asp:LinkButton>
&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton5" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Small" PostBackUrl="~/edUsuarios.aspx" ForeColor="#FFFFCC">Editar Usuarios</asp:LinkButton>
 
                    
               </td>




            </tr>            
            <tr>
                


                <!-- Aqui va el otro td -->



                <td width="80%">










       

                        <asp:Label ID="Label7" runat="server" Text="Productos en existencia" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="Black"></asp:Label>

                        <br />
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="Búsqueda"></asp:Label>
&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Buscar" />
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="4">
                        </asp:GridView>

                    <br />










       

                </td>

            </tr>            
                       

        </table>

</asp:Content>

