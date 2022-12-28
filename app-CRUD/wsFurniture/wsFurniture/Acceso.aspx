<%@ Page Title="" Language="C#" MasterPageFile="~/mpPrincipal.master" AutoEventWireup="true" CodeFile="Acceso.aspx.cs" Inherits="_Default" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    
    

    <div align="center">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/imagenes/logo.png" Height="183px" Width="274px" />

            <br />
          

    </div>
    <div align="center" class="form-box" id="login-box">
        <div class="header bg-blue-gradient">Iniciar Sesión</div>
       
            <div class="body bg-gray">
                <div class="form-group">
                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control bg-white"  placeholder="Usuario"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control bg-white" placeholder="Contraseña"></asp:TextBox>
                </div>
                <div class="footer bg-gray">
                    <asp:Button ID="btnIngresar" CommandName="Login" runat="server" Text="Iniciar Sesión" CssClass="btn bg-blue-gradient btn-block"  Width="106px" OnClick="btnIngresar_Click" />
                </div>
            </div>
        
    </div>
    
</asp:Content>

