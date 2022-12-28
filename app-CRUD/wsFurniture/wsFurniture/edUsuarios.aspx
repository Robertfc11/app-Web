<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipal.master" AutoEventWireup="true" CodeFile="edUsuarios.aspx.cs" Inherits="Default5" %>

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
                  
        </table>

    <br />
    <div align="center">
        <asp:Label ID="Label1" runat="server"  Text="Gestión de Usuarios" Font-Bold="True" Font-Names="Arial" Font-Size="Medium"></asp:Label>
    </div>
    <br /><br />

    <table align="center" width="70%" border="0">
        <tr>
            <td width="30%">

                <asp:Label ID="Label7" runat="server" Font-Names="Arial" Font-Size="Small" Text="Clave:"></asp:Label>

            </td>
            <td width="70%">

                <asp:TextBox ID="TextBox1" runat="server" MaxLength="3" Width="50px"></asp:TextBox>

            &nbsp;
                <asp:Button ID="Button4" runat="server" Height="21px" Text="Buscar" Width="56px" />

            </td>
        </tr>
        <tr>
            <td width="30%">

                <asp:Label ID="Label8" runat="server" Font-Names="Arial" Font-Size="Small" Text="Password:"></asp:Label>

            </td>
            <td width="70%">

                <asp:TextBox ID="TextBox2" runat="server" MaxLength="40" Width="300px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td width="30%">

                <asp:Label ID="Label2" runat="server" Font-Names="Arial" Font-Size="Small" Text="Nombre:"></asp:Label>

            </td>
            <td width="70%">

                <asp:TextBox ID="TextBox6" runat="server" MaxLength="25" Width="300px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td width="30%">

                <asp:Label ID="Label3" runat="server" Font-Names="Arial" Font-Size="Small" Text="Ap Paterno:"></asp:Label>

            </td>
            <td width="70%">

                <asp:TextBox ID="TextBox7" runat="server" MaxLength="25" Width="300px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td width="30%">

                <asp:Label ID="Label4" runat="server" Font-Names="Arial" Font-Size="Small" Text="Ap Materno:"></asp:Label>

            </td>
            <td width="70%">

                <asp:TextBox ID="TextBox8" runat="server" MaxLength="25" Width="300px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td width="30%">

                <asp:Label ID="Label5" runat="server" Font-Names="Arial" Font-Size="Small" Text="Correo:"></asp:Label>

            </td>
            <td width="70%">

                <asp:TextBox ID="TextBox9" runat="server" MaxLength="40" Width="300px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td width="30%">

                <asp:Label ID="Label6" runat="server" Font-Names="Arial" Font-Size="Small" Text="Teléfono:"></asp:Label>

            </td>
            <td width="70%">

                <asp:TextBox ID="TextBox10" runat="server" MaxLength="15" Width="300px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td width="30%">

                <asp:Label ID="Label15" runat="server" Font-Names="Arial" Font-Size="Small" Text="País:"></asp:Label>

            </td>
            <td width="70%">

                <asp:TextBox ID="TextBox11" runat="server" MaxLength="40" Width="300px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td width="30%">

                <asp:Label ID="Label16" runat="server" Font-Names="Arial" Font-Size="Small" Text="Estado:"></asp:Label>

            </td>
            <td width="70%">

                <asp:TextBox ID="TextBox12" runat="server" MaxLength="150" Width="300px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td width="30%">

                <asp:Label ID="Label17" runat="server" Font-Names="Arial" Font-Size="Small" Text="Colonia:"></asp:Label>

            </td>
            <td width="70%">

                <asp:TextBox ID="TextBox13" runat="server" MaxLength="150" Width="300px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td width="30%">

                <asp:Label ID="Label18" runat="server" Font-Names="Arial" Font-Size="Small" Text="Calle:"></asp:Label>

            </td>
            <td width="70%">

                <asp:TextBox ID="TextBox14" runat="server" MaxLength="150" Width="300px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td width="30%">

                <asp:Label ID="Label19" runat="server" Font-Names="Arial" Font-Size="Small" Text="No. Exterior:"></asp:Label>

            </td>
            <td width="70%">

                <asp:TextBox ID="TextBox15" runat="server" MaxLength="5" Width="300px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td width="30%">

                <asp:Label ID="Label20" runat="server" Font-Names="Arial" Font-Size="Small" Text="No. Interior:"></asp:Label>

            </td>
            <td width="70%">

                <asp:TextBox ID="TextBox16" runat="server" MaxLength="5" Width="300px"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td width="30%">

                <asp:Label ID="Label10" runat="server" Font-Names="Arial" Font-Size="Small" Text="Rol:"></asp:Label>

            </td>
            <td width="70%">


                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Value="1">Administrador</asp:ListItem>
                    <asp:ListItem Value="2">Vendedor</asp:ListItem>
                    <asp:ListItem Value="3">Espectador</asp:ListItem>
                </asp:DropDownList>


            </td>
        </tr>

        <tr>
            <td colspan="2" align="middle">
                <br />
                <asp:Button ID="Button1" runat="server" Text="Registrar" OnClick="Button1_Click" />
                &nbsp;
                <asp:Button ID="Button2" runat="server" Text="Modificar" OnClick="Button2_Click" />
                &nbsp;
                <asp:Button ID="Button3" runat="server" Text="Eliminar" OnClick="Button3_Click" />
                <br />
            </td>
        </tr>
    </table>

    <br /><br />



</asp:Content>

