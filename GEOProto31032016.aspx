<%@ Page Language="VB" EnableViewState="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<script runat="server">
    
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Init
        GC.Collect()
        
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Page.IsPostBack Then
            System.Threading.Thread.Sleep(5000)
           
        End If
        If (checkpcd.Checked = True Or checkabastecimento.Checked = True Or checkpocos.Checked = True Or checkdessalinizadores.Checked = True Or checkoutorgas.Checked = True) Then
            PanelLegendaImg.Visible = True
        End If
    End Sub

    Protected Sub LinkLegendaImg_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        PanelLegendaImg.Visible = True
    End Sub
</script>

<html>
<head runat="server">
    <title>SIGHMA - Sistema Integrado de Georreferenciamento Hídrico e de Meio Ambiente
    </title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
    <link type="text/css" rel="stylesheet" href="styles/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="styles/all.css">
    <link type="text/css" rel="stylesheet" href="styles/main.css">
    <link type="text/css" rel="stylesheet" href="styles/style-responsive.css">

    <script type="text/javascript" src="https://dl.dropboxusercontent.com/u/26549106/teste.json">
    </script>
    <script type="text/javascript" src="https://dl.dropboxusercontent.com/u/26549106/outorgasana.json">
    </script>
    <script type="text/javascript" src="https://dl.dropboxusercontent.com/u/26549106/outorgasigarnobras.json">
    </script>

    <style>
        #map
        {
            width: 100%;
            height: 640px;
        }
        .vis-hidden
        {
            border: 0;
            clip: rect(0 0 0 0);
            height: 1px;
            margin: -1px;
            overflow: hidden;
            padding: 0;
            position: absolute;
            width: 1px;
        }
        label
        {
            margin-left: 10px;
            padding-right: 10px;
            padding-left: 10px;
            background-color: #D2E4C8;
            border-radius: 5px;
            color: #000000;
        }
        input:checked + label
        {
            background-color: #3E77AB;
        }
        #legend
        {
            background: #F0F2F5;
            border: 1px dashed;
            padding: 5px 5px 8px 5px;
            margin: 5px;
            font-size: 12px;
            font-family: Arial, sans-serif;
        }
        #legend2
        {
            background: #F0F2F5;
            border: 1px dashed;
            padding: 5px 5px 8px 5px;
            margin: 5px;
            font-size: 12px;
            font-family: Arial, sans-serif;
        }
        .modalload
        {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            background-color: #FFFFFF;
            filter: alpha(opacity=60);
            opacity: 0.8;
            -moz-opacity: 0.8;
        }
        .centerload
        {
            z-index: 1000;
            margin: 300px auto;
            padding: 10px;
            width: 130px;
            background-color: #FFFFFF;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 0.8;
            -moz-opacity: 1;
        }
        .centerload img
        {
            height: 100px;
            width: 100px;
        }
        #explicacao
        {
            list-style-type: square;
        }
        #fluxo
        {
            list-style-type: disc;
        }
    </style>
</head>
<body>
    <form id="GEO" runat="server">
    <asp:ToolkitScriptManager ID="GEOFerramentas" runat="server">
    </asp:ToolkitScriptManager>
    <asp:UpdateProgress ID="ProgressGEO" runat="server" AssociatedUpdatePanelID="UpdateGEO">
        <ProgressTemplate>
            <div class="modalload">
                <div class="centerload">
                    <img class="center-block" alt="" src="images/load.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div>
        <div id="wrapper">
            <nav id="sidebar" role="navigation" data-step="2" data-intro="SIGERH" data-position="right"
                class="navbar-default navbar-static-side">
            <div class="sidebar-collapse menu-scroll">
             <img class="img-responsive center-block" src="images/semarh.png" />
             <p></p>
                 <asp:UpdatePanel ID="UpdateGEO" runat="server">
<ContentTemplate>
                <ul id="side-menu" class="nav"> 
                     <div class="clearfix"></div>
                    
                    <li><a><i class="fa fa-globe fa-fw">
                        <div class="icon-bg"></div>
                    </i><input id="checkmunicipios" checked="checked" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkmunicipios\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkmunicipios" class="menu-title">Municípios</label></a>
                    </li>
                    
                    <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                    </i><input id="checkbacias" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkbacias\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkbacias" class="menu-title">Bacias Hidrográficas</label></a>
                    </li>
                    
                    <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                    </i><input id="checkhidrografia" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkhidrografia\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkhidrografia" class="menu-title">Hidrografia</label></a>
                    </li>
                    
                    <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                        </i><input id="checkpcd" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkpcd\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkpcd" class="menu-title">PCD's</label></a>
                     </li>
                     
                     <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                        </i><input id="checkadutoras" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkadutoras\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkadutoras" class="menu-title">Adutoras</label></a>
                     </li>
                     
                     <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                    </i><input id="checkabastecimento" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkabastecimento\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkabastecimento" class="menu-title">Sist. Abastecimeto de Água</label></a> 
                    </li>
                    
                    <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                    </i><input id="checkaquiferos" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkaquiferos\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkaquiferos" class="menu-title">Aquíferos</label></a>
                    </li>
                    
                      <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                    </i><input id="checkpocos" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkpocos\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkpocos" class="menu-title">Poços</label></a>
                    </li>
                    
                    <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                    </i><input id="checkdessalinizadores" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkdessalinizadores\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkdessalinizadores" class="menu-title">Dessalinizadores</label>
</a>
                    </li>   
                    
                    <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                    </i><input id="checkoutorgas" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkoutorgas\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkoutorgas" class="menu-title">Outorgas</label></a>
                    </li>  
                    <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                    </i><input id="checkteste" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkteste\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkteste" class="menu-title">Check Teste</label></a>
                    </li>
                    <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                    </i><input id="checkoutorgasana" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkoutorgasana\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkoutorgasana" class="menu-title">Outorgas Teste</label></a>
                    </li>
                </ul>
                
                </ContentTemplate>
        </asp:UpdatePanel>
            </div>
        </nav>
            <div id="page-wrapper">
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">
                            <b>SIGHMA</b></div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-right">
                        <li><i class="fa fa-question-circle"></i>&nbsp;<asp:LinkButton ID="LinkAjuda" runat="server">Ajuda</asp:LinkButton>&nbsp;&nbsp;</li>
                        <asp:ModalPopupExtender ID="ModalAjuda" runat="server" PopupControlID="PanelAjuda"
                            OkControlID="BotaoOKAjuda" CancelControlID="BotaoFecharAjuda" TargetControlID="LinkAjuda">
                        </asp:ModalPopupExtender>
                        <asp:Panel ID="PanelAjuda" runat="server" Style="display: none">
                            <div class="modal">
                                <div class="modal-dialog" style="background-color: #D2E4C8">
                                    <div class="modal-header" style="background-color: #D2E4C8">
                                        <asp:LinkButton ID="BotaoFecharAjuda" class="close" runat="server" Text="×" CausesValidation="false" />
                                        <h4 class="modal-title" style="background-color: D2E4C8">
                                            <b>AJUDA SIGERH</b></h4>
                                    </div>
                                    <div class="modal-body" style="background-color: #CDDFE6">
                                        <ul id="explicacao">
                                            <li style="color: #242424">O SIGERH funciona a partir da sobreposição de camadas de
                                                mapas;</li>
                                            <li style="color: #242424">O menu lateral é o responsável pelo controle das camadas;</li>
                                            <li style="color: #242424">Por padrão a Camada "Municípios" já vem setada ao se carregar
                                                o sistema;</li>
                                            <li style="color: #242424">No menu lateral uma camada carregada fica em Azul, enquanto
                                                uma não carregada ficará Verde;</li>
                                            <li style="color: #242424">Para se carregar/descarregar uma camada basta que o usuário
                                                clique na camada desejada no menu lateral e essa camada será carregada ou descarregada;</li>
                                            <li style="color: #242424">O usuário pode carregar ou descarregar uma camada a qualquer
                                                momento durante o uso;</li>
                                            <li style="color: #242424">Ao se clicar em qualquer área ou marcador do mapa, será apresentado
                                                um conjunto de informações referente aos pontos selecionados.</li>
                                        </ul>
                                        <hr />
                                        <h4>
                                            <b>Vejamos abaixo um exemplo de utilização do SIGERH:</b></h4>
                                        <ul id="fluxo">
                                            <li style="color: #242424">Tomemos como exemplo a situação em que o usuário quer visualizar
                                                os poços e as bacias hidrográficas que servem a cidade de Caicó;</li>
                                            <li style="color: #242424">No menu lateral o usuário deve clicar no Texto: "Bacias Hidrográficas",
                                                carregando assim a camada referente;</li>
                                            <li style="color: #242424">No menu lateral o usuário deve clicar no Texto: "Poços",
                                                carregando assim a camada referente;</li>
                                            <li style="color: #242424">Após o carregamento aparecerá na tela o mapa com todas as
                                                camadas selecionadas;</li>
                                        </ul>
                                    </div>
                                    <asp:Button ID="BotaoOKAjuda" runat="server" Visible="false" Text="OK" CssClass="btn btn-danger"
                                        CausesValidation="false" />
                                </div>
                            </div>
                        </asp:Panel>
                    </ol>
                    <div class="clearfix">
                    </div>
                </div>
                <div class="page-content">
                    <div id="tab-general">
                        <div class="row mbl">
                            <div class="col-lg-12">
                                <div class="panel">
                                    <div class="panel-body">
                                        <div class="row" style="margin-left: 3px; margin-right: 3px;">
                                            <div id="map">
                                            </div>

                                            <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

                                            <script type="text/javascript" src="http://dwellcation.com/markerclusterer_packed.js"></script>

                                            <script src="script/geo.js"></script>

                                            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgV50vyQdWlZMS0zUli5zfbeIUQI8c9p4&callback=initMap&signed_in=true"
                                                async defer>
                                            </script>

                                        </div>
                                        <asp:UpdatePanel ID="UpdateLegendaImg" runat="server">
                                            <ContentTemplate>
                                                <asp:Panel ID="PanelLegendaImg" runat="server" Visible="false">
                                                    <div class="col-lg-4" style="background-color: #F0F2F5; border: 1px dashed; color: #242424;
                                                        padding-bottom: 5px; padding-top: 5px; margin-top: 10px">
                                                        <img src="images/marcadores/pcd.png" />PCD'S - Sala de Situação/RN (ANA)<br />
                                                        <img src="images/marcadores/pcdSEMARH.png" />PCD'S - SEMARH-RN<br />
                                                        <img src="images/marcadores/saa.png" />Sist. Abastecimento de Água<br />
                                                        <img src="images/marcadores/pocos.png" />Poços<br />
                                                        <img src="images/marcadores/dessalinizadores.png" />Dessalinizadores<br />
                                                        <img src="images/marcadores/OutorgasAna.png" />Outorgas - ANA<br />
                                                        <img src="images/marcadores/Outorgas.png" />Outorgas - IGARN<br />
                                                    </div>
                                                </asp:Panel>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="footer">
                    <div class="copyright">
                        <a href="http://www.semarh.rn.gov.br">2016 © SEMARH - Secretaria do Meio Ambiente e
                            dos Recursos Hídricos</a></div>
                </div>
            </div>
        </div>
    </div>

    <script src="script/html5shiv.js"></script>

    <script src="script/respond.min.js"></script>

    <script>        (function($) {
            $.fn.Disposable = function(cln) {
                return this.each(function() {
                    var el = this;
                    if (!el.dispose) {
                        el.dispose = cleanup; // will be called by 
                        // Microsoft for cleanup
                        $(window).bind("unload", cleanup);
                    }
                    function cleanup() {
                        if (!el)
                            return;
                        $(el).unbind();
                        $(window).unbind("unload", cleanup);
                        el.dispose = null;
                        el = null;
                    };
                });
            };
        })(jQuery);
        function add() {
            $get('res').value =
		parseInt($get('i1').value) + parseInt($get('i2').value);
        }
        Sys.Application.add_load(function() {
            $('.num').change(add).Disposable();
        });</script>

    </form>
</body>
</html>
