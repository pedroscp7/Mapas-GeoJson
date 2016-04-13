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
        If (checkpcd.Checked = True Or checkabastecimento.Checked = True Or checkpocos.Checked = True Or checkdessalinizadores.Checked = True Or checkoutorgas.Checked = True Or checkmonitoramento.Checked = True Or checkbarragens.Checked = True Or checkbarsub.Checked = True) Then
            PanelLegendaImg.Visible = True
        End If
    End Sub

    Protected Sub LinkLegendaImg_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        PanelLegendaImg.Visible = True
    End Sub
</script>

<html>
<head id="Head1" runat="server">
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
            padding: 3px;
            margin: 5px;
            font-size: 12px;
            font-family: Arial, sans-serif;
        }
        #legend2
        {
            background: #F0F2F5;
            border: 1px dashed;
            padding: 3px;
            margin: 5px;
            font-size: 12px;
            font-family: Arial, sans-serif;
        }
        #legend3
        {
            background: #F0F2F5;
            border: 1px dashed;
            padding: 3px;
            margin: 5px;
            font-size: 12px;
            font-family: Arial, sans-serif;
        }
        #legendadultora
        {
            background: #F0F2F5;
            border: 1px dashed;
            padding: 3px;
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
            <nav id="sidebar" role="navigation" data-step="2" data-intro="SIGHMA" data-position="right"
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
<label for="checkdessalinizadores" class="menu-title">PAD - Dessalinizadores</label></a>
                    </li>   
                    
                    <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                    </i><input id="checkoutorgas" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkoutorgas\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkoutorgas" class="menu-title">Outorgas</label></a>
                    </li>  
                    
                    <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                        </i><input id="checkmonitoramento" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkmonitoramento\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkmonitoramento" class="menu-title">Pontos de Monitoramento</label></a>
                     </li>
					 
					 <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                        </i><input id="checkbarragens" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkbarragens\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkbarragens" class="menu-title">Barragens</label></a>
                     </li>
                     
                     <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                        </i><input id="checkbarsub" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkbarsub\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkbarsub" class="menu-title">PSP - Bar. Subterraneas</label></a>
                     </li>
                     
                     <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                        </i><input id="checkete" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checkete\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checkete" class="menu-title">CAERN ETE's</label></a>
                     </li>
                     
                     <li><a><i class="fa fa-map-marker fa-fw">
                        <div class="icon-bg"></div>
                        </i><input id="checketa" runat="server" onchange="javascript:setTimeout('__doPostBack(\'checketa\',\'\')', 0);" type="checkbox" class="vis-hidden new-post-tags" />
<label for="checketa" class="menu-title">CAERN ETA's</label></a>
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
                                        <h4 class="modal-title" style="background-color: #D2E4C8">
                                            <b>AJUDA SIGHMA</b></h4>
                                    </div>
                                    <div class="modal-body" style="background-color: #CDDFE6">
                                        <ul id="explicacao">
                                            <li style="color: #242424">O SIGHMA funciona a partir da sobreposição de camadas de
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
                                            <b>Vejamos abaixo um exemplo de utilização do SIGHMA:</b></h4>
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

                                            <script>
                var prm = Sys.WebForms.PageRequestManager.getInstance(); 
                prm.add_initializeRequest(InitializeRequest);
                prm.add_endRequest(EndRequest);

                function InitializeRequest(sender, args) { 
                }

                // fires after the partial update of UpdatePanel
                function EndRequest(sender, args) {
                initMap();
                }

               var styles = [ 
               {
         featureType: "road",
         elementType: "labels",
         stylers: [
           { visibility: "off" }
         ]
       }
     ];
  


                                                 function initMap() {
                                                    map = new google.maps.Map(document.getElementById('map'), {
                                                        zoom: 8,
                                                        center: { lat: -5.900000, lng: -36.915000 },
                                                        styles: styles,
                                                        mapTypeId: google.maps.MapTypeId.TERRAIN
                                                        });
                                                        
                                                       //var mc = new MarkerClusterer(map);
                                                        
                                                                                                            
                                                    
                                                    
                                                   //Municípios
                                                   
 
                                                      if (document.getElementById('checkmunicipios').checked == true)  {  
                                                        var municipios = new google.maps.Data();
                                                        municipios.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/municipios_rn3.geojson');


                                                        municipios.setStyle(function(feature){
                                                           
                                                            var color = 'white';
                                                            switch (feature.getProperty('Situacao')){
                                                                case 'Colapso':
                                                              color = '#f30808';
                                                                
                                                                break;
                                                                
                                                                case 'Colapso em jun\/16':
                                                                color = '#f6ee10';
                                                               
                                                                break;
                                                                
                                                                case 'Colapso em Fev\/17':
                                                                color = '#16a712';
                                                                
                                                                break;
                                                                
                                                                case 'null':
                                                                color = '#ff9900';
                                                                
                                                                break;
                                                                }
                                                                return ({
                                                                fillColor: color,
                                                                fillOpacity: 0.6,
                                                                strokeWeight: 0.5
                                                            })
                                                            
                                                        });
                                                        map: map
                                                        municipios.setMap(map);
                                                        createClickablePolyGEO(municipios, map);
                                                         //Legendas Municípios
                                                          var legend = document.createElement('div');
                                                       legend.id = 'legend3';
                                                        var content = [];
                                                        content.push('<h3>Municípios</h3>' + '<hr>');
                                                        
                                                        content.push('<div  class="col-lg-12"><img  style="margin-left:3px" src="images/Colapso.png"></img>&nbsp;&nbsp;Colapso</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/Colapso1606.png"></img>&nbsp;&nbsp;Colapso em 16/06/16</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/Colapso1702.png"></img>&nbsp;&nbsp;Colapso em 17/02/17</div>' + '<br>');
                                                        
                                                        legend.innerHTML = content.join('');
                                                        legend.index = 1;
                                                        map.controls[google.maps.ControlPosition.LEFT_TOP].push(legend);

                                                        function createClickablePolyGEO(poly, map) {
                                                            var infoWindowGEO = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(poly, 'click', function(event) {
                                                                
                                                                var htmlgeo = '<h3 style="color:#3E77AB">' + event.feature.getProperty("NOME") + '</h3>' + '<hr>';
                                                                htmlgeo += '<strong>População:</strong> ' + event.feature.getProperty("POPULACAO") + '</br>';
                                                                htmlgeo += '<strong>Área(km<sup>2</sup>):</strong> ' + event.feature.getProperty("AREA_KM") + '</br>';
                                                                htmlgeo += '<strong>Densidade Demográfica(hab/km<sup>2</sup>):</strong> ' + event.feature.getProperty("DENSIDADE") + '</br>';
                                                                
                                                                if (event.feature.getProperty('Situacao') == 'Sem informação') {
                                                                htmlgeo += '<strong>Link do Documento:</strong> ' + "Sem link" + '</br>';
                                                                } else {
                                                                htmlgeo += '<strong>Link do Documento:</strong> '+ '<a target="_blank" href="' + event.feature.getProperty("link") + '">' + event.feature.getProperty("link") + '</a>'  + '</br>'
                                                                }

                                                                if (event.feature.getProperty('Situacao') == null) {
                                                                htmlgeo += '<strong>Situação de Abastecimento:</strong> ' + "Sem Previsão de Colapso" + '</br>';
                                                                } else {
                                                                htmlgeo += '<strong>Situação de Abastecimento:</strong> ' + event.feature.getProperty("Situacao") + '</br>';
                                                                }
                                                                if (event.feature.getProperty('Emergencia') == 'emergencia') {
                                                                htmlgeo += '<strong>Situação de Emergência:</strong> ' + "Em estado de Emergência" + '</br>';
                                                                } else {
                                                                htmlgeo += '<strong>Situação de Emergência:</strong> ' + "Sem Emergênica Detectada" + '</br>';
                                                                }
                                                                 
                                                                infoWindowGEO.setContent(htmlgeo);
                                                                infoWindowGEO.setPosition(event.latLng);
                                                                infoWindowGEO.open(map);
                                                            });
                                                        }   
                                                    }

                                                    //DESSALINIZADORES

                                                    if (document.getElementById('checkdessalinizadores').checked == true) {
                                                        var dessalinizadores = new google.maps.Data();
                                                        dessalinizadores.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/dessalinizadores.geojson');
                                                        

                                                        map: map
                                                        dessalinizadores.setMap(map);
                                                        createClickableMarkerDessalinizadores(dessalinizadores, map);
                                                        
                                                         dessalinizadores.setStyle(function(feature){
                                                        var iconed;
                                                        iconed='images/marcadores/dessalinizadores.png';
                                                        
                                                        
                              
                                    
                                                        return({
		                                                    icon: iconed
		                                                    })
                                                        });

                                                        function createClickableMarkerDessalinizadores(marker, map) {
                                                           
                                                            var infoWindowDessalinizadores = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                            var htmld = '<h3 style="color:#3E77AB">' + event.feature.getProperty("Identifica") + '</h3>' + '<hr>';
                                                                htmld += '<strong>Localidade:</strong> ' + event.feature.getProperty("Comunidade") + '</br>';
                                                                htmld += '<strong>Tipo:</strong> ' + event.feature.getProperty("Tipo") + '</br>';
                                                                htmld += '<strong>Famílias Atendidas:</strong> ' + event.feature.getProperty("Nº_FAM_") + '</br>';
                                                               // htmld += '<strong>Longitude:</strong> ' + event.feature.getProperty("LONG__GD_") + '</br>';
                                                               // htmld += '<strong>Latitude:</strong> ' + event.feature.getProperty("LAT__GD_") + '</br>';
                                                                infoWindowDessalinizadores.setContent(htmld);
                                                                infoWindowDessalinizadores.setPosition(event.latLng);
                                                                infoWindowDessalinizadores.open(map);
                                                            });
                                                        }
                                                    }


                                                    // Poços

                                                    if (document.getElementById('checkpocos').checked == true) {

                                                        var pocos = new google.maps.Data();
                                                        pocos.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/pocos.geojson');
                                                        pocos.setStyle(function(feature){
                                                        var iconep;
                                                        if(feature.getProperty('Orig_inf') == 'INCRA'){
                                                        iconep='images/marcadores/pocoIncra.png';
                                                        }else{
                                                        iconep='images/marcadores/pocos.png';
                                                        }
                                                        
                                                        
                              
                                    
                                                        return({
		                                                    icon: iconep
		                                                    })
                                                        });
                                                        
  
                                                        map: map
                                                        pocos.setMap(map);
                                                        createClickableMarkerP(pocos, map);
                                                      
                                                      
                                                        function createClickableMarkerP(marker, map) {
                                                            var infoWindowPocos = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                                var htmlp = '<h3 style="color:#3E77AB">' + event.feature.getProperty("Poço_Nº") + '</h3>' + '<hr>';
                                                                htmlp += '<strong>Companhia de Perfuração:</strong> ' + event.feature.getProperty("Cia_Perf") + '</br>';
                                                                htmlp += '<strong>Localidade:</strong> ' + event.feature.getProperty("Localidade") + '</br>';
                                                                htmlp += '<strong>Proprietário:</strong> ' + event.feature.getProperty("Proprietá") + '</br>';
                                                                htmlp += '<strong>Data de Perfuração:</strong> ' + event.feature.getProperty("data_perf") + '</br>';
                                                                htmlp += '<strong>Profundidade(m):</strong> ' + event.feature.getProperty("Prof__m_") + '</br>';
                                                                
                                                                if(event.feature.getProperty("Q__m3_h_") == 0){
                                                                htmlp += '<strong>Vazão(m<sup>3</sup>/h):</strong> ' + "Sem dados" + '</br>';
                                                                } if(event.feature.getProperty("Ne__m_") == 0){
                                                                htmlp += '<strong>Nível Estático(m):</strong> ' + "Sem dados" + '</br>';
                                                                } if(event.feature.getProperty("Nd__m_") == 0){
                                                                htmlp += '<strong>Nível Dinâmico(m):</strong> ' + "Sem dados" + '</br>';
                                                                }
                                                                
                                                                if(event.feature.getProperty("Q__m3_h_") != 0){
                                                                htmlp += '<strong>Vazão(m<sup>3</sup>/h):</strong> ' + event.feature.getProperty("Q__m3_h_") + '</br>';
                                                                } if(event.feature.getProperty("Ne__m_") != 0){
                                                                htmlp += '<strong>Nível Estático(m):</strong> ' + event.feature.getProperty("Ne__m_") + '</br>';
                                                                } if(event.feature.getProperty("Nd__m_") != 0){
                                                                htmlp += '<strong>Nível Dinâmico(m):</strong> ' + event.feature.getProperty("Nd__m_") + '</br>';
                                                                }
                                                                infoWindowPocos.setContent(htmlp);
                                                                infoWindowPocos.setPosition(event.latLng);
                                                                infoWindowPocos.open(map);
                                                            });
                                                        }                                                         
                                                         
                                                        var pocoscaern = new google.maps.Data();
                                                        pocoscaern.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/pocos_caern_rn.geojson');
                                                        pocoscaern.setStyle(function(feature){
                                                        var iconepcaern;
                                                       
                                                        iconepcaern='images/marcadores/pocosCAERN.png';
                                                        
                                                        
                                                        
                              
                                    
                                                        return({
		                                                    icon: iconepcaern
		                                                    })
                                                        });
                                                        
  
                                                        map: map
                                                        pocoscaern.setMap(map);
                                                        createClickableMarkerPCaern(pocoscaern, map);
                                                        function createClickableMarkerPCaern(marker, map) {
                                                            var infoWindowPocosCaern = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                                var htmlpcaern = '<h3 style="color:#3E77AB">' + event.feature.getProperty("DEN") + '</h3>' + '<hr>';
                                                                htmlpcaern += '<strong>Companhia de Perfuração:</strong> ' + event.feature.getProperty("COMP") + '</br>';
                                                                htmlpcaern += '<strong>Localidade:</strong> ' + event.feature.getProperty("END") + '</br>';
                                                                htmlpcaern += '<strong>Proprietário:</strong> ' + event.feature.getProperty("COMP") + '</br>';
                                                                htmlpcaern += '<strong>Data de Perfuração:</strong> ' + "Sem Informação" + '</br>';
                                                                htmlpcaern += '<strong>Tipo:</strong> ' + event.feature.getProperty("TIP") + '</br>';
                                                                htmlpcaern += '<strong>Profundidade(m):</strong> ' + event.feature.getProperty("PRO") + '</br>';
                                                                htmlpcaern += '<strong>Vazão(m<sup>3</sup>/h):</strong> ' + event.feature.getProperty("VAZ") + '</br>';
                                                                htmlpcaern += '<strong>Nível Estático(m):</strong> ' + event.feature.getProperty("NES") + '</br>';
                                                                htmlpcaern += '<strong>Nível Dinâmico(m):</strong> ' + event.feature.getProperty("NDI") + '</br>';
                                                                htmlpcaern += '<strong>Situação:</strong> ' + event.feature.getProperty("SIT") + '</br>';
                                                                htmlpcaern += '<strong>Diâmetro(polegadas):</strong> ' + event.feature.getProperty("DIA") + '</br>';

                                                               infoWindowPocosCaern.setContent(htmlpcaern);
                                                               infoWindowPocosCaern.setPosition(event.latLng);
                                                               infoWindowPocosCaern.open(map);
                                                            });
                                                    }
                                                    var pocossemarhninst = new google.maps.Data();
                                                        pocossemarhninst.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/pocos_semarh_n_instalados_rn.geojson');
                                                        pocossemarhninst.setStyle(function(feature){
                                                        var iconepsemarhninst;
                                                       
                                                        iconepsemarhninst='images/marcadores/pocosSEMARHNInstalados.png';
                                    
                                                        return({
		                                                    icon: iconepsemarhninst
		                                                    })
                                                        });
                                                        
  
                                                        map: map
                                                        
                                                        pocossemarhninst.setMap(map);
                                                        createClickableMarkerPSemarhNInst(pocossemarhninst, map);
                                                        function createClickableMarkerPSemarhNInst(marker, map) {
                                                            var infoWindowPocosSemarhNInst = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                                var htmlpsemarhninst = '<h3 style="color:#3E77AB">' + event.feature.getProperty("Poço_N") + '</h3>' + '<hr>';
                                                                htmlpsemarhninst += '<strong>Companhia de Perfuração:</strong> ' + event.feature.getProperty("COMP") + '</br>';
                                                                htmlpsemarhninst += '<strong>Localidade:</strong> ' + event.feature.getProperty("Localidade") + '</br>';
                                                                htmlpsemarhninst += '<strong>Proprietário:</strong> ' + event.feature.getProperty("Proprietá") + '</br>';
                                                                htmlpsemarhninst += '<strong>Data de Perfuração:</strong> ' + event.feature.getProperty("DT_Perf") + '</br>';
                                                                htmlpsemarhninst += '<strong>Profundidade(m):</strong> ' + event.feature.getProperty("Prof_m") + '</br>';
                                                                htmlpsemarhninst += '<strong>Vazão(m<sup>3</sup>/h):</strong> ' + event.feature.getProperty("Q_m3_h") + '</br>';
                                                                htmlpsemarhninst += '<strong>Nível Estático(m):</strong> ' + event.feature.getProperty("Ne_m") + '</br>';
                                                                htmlpsemarhninst += '<strong>Nível Dinâmico(m):</strong> ' + event.feature.getProperty("Nd_m") + '</br>';
                                                                htmlpsemarhninst += '<strong>Testado:</strong> ' + "Testado" + '</br>';

                                                               infoWindowPocosSemarhNInst.setContent(htmlpsemarhninst);
                                                               infoWindowPocosSemarhNInst.setPosition(event.latLng);
                                                               infoWindowPocosSemarhNInst.open(map);
                                                            });
                                                    }
                                                    
                                                    var pocossemar2016 = new google.maps.Data();
                                                        pocossemar2016.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/pocos_semarh_2016_rn.geojson');
                                                        pocossemar2016.setStyle(function(feature){
                                                        var iconepsemarhninst;
                                                       
                                                        iconepsemarh2016='images/marcadores/pocosSEMARH2016.png';
                                    
                                                        return({
		                                                    icon: iconepsemarh2016
		                                                    })
                                                        });
                                                        
  
                                                        map: map
                                                        
                                                        pocossemar2016.setMap(map);
                                                        createClickableMarkerPSemarh2016(pocossemar2016, map);
                                                        function createClickableMarkerPSemarh2016(marker, map) {
                                                            var infoWindowPocosSemarh2016 = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                                var htmlpsemarh2016 = '<h3 style="color:#3E77AB">' + event.feature.getProperty("N°_POÇO") + '</h3>' + '<hr>';
                                                                htmlpsemarh2016 += '<strong>Companhia de Perfuração:</strong> ' + event.feature.getProperty("COMP") + '</br>';
                                                                htmlpsemarh2016 += '<strong>Localidade:</strong> ' + event.feature.getProperty("LOCALIDADE") + '</br>';
                                                                htmlpsemarh2016 += '<strong>Proprietário:</strong> ' + event.feature.getProperty("PROPR") + '</br>';
                                                                htmlpsemarh2016 += '<strong>Data de Perfuração:</strong> ' + event.feature.getProperty("DATA_FINAL") + '</br>';
                                                                htmlpsemarh2016 += '<strong>Profundidade(m):</strong> ' + event.feature.getProperty("PROF___m_") + '</br>';
                                                                htmlpsemarh2016 += '<strong>Vazão(m<sup>3</sup>/h):</strong> ' + "Sem Informação" + '</br>';
                                                                htmlpsemarh2016 += '<strong>Situação:</strong> ' + "Situação" + '</br>';

                                                               infoWindowPocosSemarh2016.setContent(htmlpsemarh2016);
                                                               infoWindowPocosSemarh2016.setPosition(event.latLng);
                                                               infoWindowPocosSemarh2016.open(map);
                                                            });
                                                    }
                                                    }
                                                    

                                                    // Aquíferos

                                                    if (document.getElementById('checkaquiferos').checked == true) {
                                                        var aquiferos = new google.maps.Data();
                                                        aquiferos.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/aquiferos.geojson');

                                                       aquiferos.setStyle(function(feature) {
                                                            var color = 'white';
                                                            
                                                            switch (feature.getProperty('Aquifero')){
                                                                case 'Aluviões':
                                                                color = '#FFFF00';
                                                                break;
                                                                
                                                                case 'Cristalino':
                                                                color = '#778899';
                                                                break;
                                                                
                                                                case 'Dunas Móveis':
                                                                color = '#FFFF00';
                                                                break;
                                                                
                                                                case 'Formação Açu':
                                                                color = '#006400';
                                                                break;
                                                                
                                                                case 'Formação Barreiras':
                                                                color = '#FF8C00';
                                                                break;
                                                                
                                                                case 'Formação Jandaíra':
                                                                color = '#00FFFF';
                                                                break;
                                                                
                                                                
                                                            }
                                                            return ({
                                                                fillColor: color,
                                                                fillOpacity: 0.4,
                                                                strokeWeight: 0
                                                            })

                                                        });
                                                        if (document.getElementById('checkmunicipios').checked == true) {
                                                        municipios.setStyle({
                                                            fillColor: '#ff9900',
                                                            fillOpacity: 0,
                                                            strokeWeight: 0.5,
                                                            strokeColor: "#3E77AB",
                                                            
                                                        });
}

                                                        map: map
                                                        aquiferos.setMap(map);
                                                        createClickablePolyAquiferos(aquiferos, map);


                                                        // LEGENDAS AQUÍFERO
                                                        
                                                       var legend = document.createElement('div');
                                                       legend.id = 'legend';
                                                        var content = [];
                                                       
                                                        content.push('<h3>Aquíferos</h3>' + '<hr>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/aluvioesl.png"></img>&nbsp;&nbsp;Aluviões</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/formacaobarreirasl.png"></img>&nbsp;&nbsp;Formação Barreiras</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/formacaojandairal.png"></img>&nbsp;&nbsp;Formação Jandaíra</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/formacaoacul.png"></img>&nbsp;&nbsp;Formação Açu</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/cristalinol.png"></img>&nbsp;&nbsp;Cristalino</div>' + '<br>');

                                                        legend.innerHTML = content.join('');
                                                        legend.index = 1;
                                                        map.controls[google.maps.ControlPosition.LEFT_TOP].push(legend);
                                                    }

                                                    function createClickablePolyAquiferos(poly, map) {
                                                        var infoWindowAquiferos = new google.maps.InfoWindow();
                                                        google.maps.event.addListener(poly, 'click', function(event) {
                                                            var htmlaq = '<h3 style="color:#3E77AB">' + event.feature.getProperty("Aquifero") + '</h3>' + '<hr>';
                                                            htmlaq += '<strong>Descrição:</strong> ' + event.feature.getProperty("Descricao") + '</br>';
                                                            htmlaq += '<strong>Adequada para consumo humano:</strong> ' + event.feature.getProperty("Consumo") + '</br>';
                                                            htmlaq += '<strong>Adequada para consumo animal:</strong> ' + event.feature.getProperty("cons_anima") + '</br>';
                                                            htmlaq += '<strong>Adequada para uso industrial:</strong> ' + event.feature.getProperty("industria") + '</br>';
                                                            htmlaq += '<strong>Adequada para irrigação:</strong> ' + event.feature.getProperty("Irrigacao") + '</br>';
                                                            infoWindowAquiferos.setContent(htmlaq);
                                                            infoWindowAquiferos.setPosition(event.latLng);
                                                            infoWindowAquiferos.open(map);
                                                        });

                                                    }
                                                    // Sistemas de Abastecimento de Água
                                                    if (document.getElementById('checkabastecimento').checked == true) {
                                                        var abastecimento = new google.maps.Data();
                                                        abastecimento.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/sistemasdeabastecimentodeagua.geojson');

                                                        map: map
                                                        abastecimento.setMap(map);
                                                        createClickableMarkerAbastecimento(abastecimento, map);
                                                        
                                                        abastecimento.setStyle(function(feature){
                                                        var iconesaa;
                                                        iconesaa='images/marcadores/saa.png';
                                                        
                                                        
                              
                                    
                                                        return({
		                                                    icon: iconesaa
		                                                    })
                                                        });

                                                        function createClickableMarkerAbastecimento(marker, map) {
                                                            var infoWindowAbastecimento = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                                var htmlab = '<h3 style="color:#3E77AB">' + event.feature.getProperty("Obra") + '</h3>' + '<hr>';
                                                                htmlab += '<strong>Fonte:</strong> ' + event.feature.getProperty("Fonte") + '</br>';
                                                                htmlab += '<strong>Nome:</strong> ' + event.feature.getProperty("Nome") + '</br>';
                                                                htmlab += '<strong>Vazão L/h:</strong> ' + event.feature.getProperty("Vazao_l_h") + '</br>';
                                                                htmlab += '<strong>Descrição:</strong> ' + event.feature.getProperty("Descricao") + '</br>';
                                                                htmlab += '<strong>Data de Entrega da Obra:</strong> ' + event.feature.getProperty("Dt_Ent_Obr") + '</br>';
                                                                htmlab += '<strong>Famílias Atendidas:</strong> ' + event.feature.getProperty("Familias") + '</br>';
                                                                infoWindowAbastecimento.setContent(htmlab);
                                                                infoWindowAbastecimento.setPosition(event.latLng);
                                                                infoWindowAbastecimento.open(map);
                                                            });
                                                        }
                                                        
                                                        var adutorassaa = new google.maps.Data();
                                                        adutorassaa.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/adutoras.saa.geojson');
                                                        adutorassaa.setStyle({
                                                    strokeColor: '#9b21f9',
                                                    strokeWeight: 1.6
                                                });
                                                        map: map
                                                        adutorassaa.setMap(map);
                                                        

                                                    }
                                                    //Bacias Hidrográficas
                                                    if (document.getElementById('checkbacias').checked == true) {
                                                        var bacias = new google.maps.Data();
                                                        bacias.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/baciashidrograficas.geojson');

                                                        bacias.setStyle(function(feature) {
                                                            var color = 'white';
                                                            switch (feature.getProperty('BACIA')){
                                                                case '15-1':
                                                                color = '#f5dbdb';
                                                                break;
                                                                
                                                                case '15-2':
                                                                color = '#f5dbdb';
                                                                break;
                                                                
                                                                case '15-3':
                                                                color = '#f5dbdb';
                                                                break;
                                                                
                                                                case '15-4':
                                                                color = '#f5dbdb';
                                                                break;
                                                                
                                                                case '16-1':
                                                                color = '#8cccd1';
                                                                break;
                                                                
                                                                case '16-2':
                                                                color = '#8cccd1';
                                                                break;
                                                                
                                                                case '16-3':
                                                                color = '#8cccd1';
                                                                break;
                                                                
                                                                case '16-4':
                                                                color = '#8cccd1';
                                                                break;
                                                                
                                                                case '16-6':
                                                                color = '#8cccd1';
                                                                break;
                                                                
                                                                case '16-7':
                                                                color = '#8cccd1';
                                                                break;
                                                                
                                                                case '16-8':
                                                                color = '#8cccd1';
                                                                break;
                                                                
                                                                case 'Bacia do rio Apodi/Mossoró':
                                                                color = '#fff500';
                                                                break;
                                                                
                                                                case 'Bacia do rio Boqueirão':
                                                                color = '#fffa73';
                                                                break;
                                                                
                                                                case 'Bacia do rio Catú':
                                                                color = '#dedede';
                                                                break;
                                                                
                                                                case 'Bacia do rio Ceará-Mirim':
                                                                color = '#faedcf';
                                                                break;
                                                                
                                                                case 'Bacia do rio Curimataú':
                                                                color = '#ffcc66';
                                                                break;
                                                                
                                                                case 'Bacia do rio Guajú':
                                                                color = '#e594ad';
                                                                break;
                                                                
                                                                case 'Bacia do rio Jacú':
                                                                color = '#ccff00';
                                                                break;
                                                                
                                                                case 'Bacia do rio Maxaranguape':
                                                                color = '#a8c2cf';
                                                                break;
                                                                
                                                                case 'Bacia do rio Pirangí':
                                                                color = '#f7c4b5';
                                                                break;
                                                                
                                                                case 'Bacia do rio Piranhas/Açú':
                                                                color = '#d1e8d6';
                                                                break;
                                                                
                                                                case 'Bacia do rio Potengi':
                                                                color = '#ffff99';
                                                                break;
                                                                
                                                                case 'Bacia do rio Punaú':
                                                                color = '#7ac4a1';
                                                                break;
                                                                
                                                                case 'Bacia do rio Rio Doce':
                                                                color = '#edbf8a';
                                                                break;
                                                                
                                                                case 'Bacia do rio Trairí':
                                                                color = '#c2c2db';
                                                                break;                                                                
                                                                
                                                            }
                                                            return ({
                                                                fillColor: color,
                                                                fillOpacity: 0.4,
                                                                strokeWeight: 0.8
                                                            })

                                                        });

                                                        map: map
                                                        bacias.setMap(map);
                                                        createClickablePolyBH(bacias, map);
                                                          //Legendas Bacias
                                                          var legend = document.createElement('div');
                                                       legend.id = 'legend2';
                                                        var content = [];
                                                        content.push('<h3>Bacias Hidrográficas</h3>' + '<hr>');
                                                        
                                                        content.push('<div  class="col-lg-12"><img  style="margin-left:3px" src="images/baciasrioapodil.png"></img>&nbsp;&nbsp;Bacia do rio Apodi/Mossoró</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/baciasrioboqueiraol.png"></img>&nbsp;&nbsp;Bacia do rio Boqueirão</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/baciasriocearamiriml.png"></img>&nbsp;&nbsp;Bacia do rio Ceará-Mirim</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/baciasriocurimataul.png"></img>&nbsp;&nbsp;Bacia do rio Curimataú</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/baciasrioguajul.png"></img>&nbsp;&nbsp;Bacia do rio Guajú</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/baciasriojacul.png"></img>&nbsp;&nbsp;Bacia do rio Jacú</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/baciasriocatul.png"></img>&nbsp;&nbsp;Bacia do rio Catú</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/baciasriomaxaranguapel.png"></img>&nbsp;&nbsp;Bacia do rio Maxaranguape</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/baciasriopirangil.png"></img>&nbsp;&nbsp;Bacia do rio Pirangí</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/baciasriopiranhasacul.png"></img>&nbsp;&nbsp;Bacia do rio Piranhas/Açú</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/baciasriopotengil.png"></img>&nbsp;&nbsp;Bacia do rio Potengi</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/baciasriopunaul.png"></img>&nbsp;&nbsp;Bacia do rio Punaú</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/baciasriodocel.png"></img>&nbsp;&nbsp;Bacia do rio Rio Doce</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/baciasriotrairil.png"></img>&nbsp;&nbsp;Bacia do rio Trairí</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/bacias15l.png"></img>&nbsp;&nbsp;15-[1-4]</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/bacias16l.png"></img>&nbsp;&nbsp;16-[1-8]</div>' + '<br>');
                                                        legend.innerHTML = content.join('');
                                                        legend.index = 1;
                                                        map.controls[google.maps.ControlPosition.LEFT_TOP].push(legend);
                                                    }
                                                    function createClickablePolyBH(poly, map) {
                                                        var infoWindowBH = new google.maps.InfoWindow();
                                                        google.maps.event.addListener(poly, 'click', function(event) {
                                                            var htmlbh = '<h3 style="color:#3E77AB">' + event.feature.getProperty("BACIA") + '</h3>';
                                                            infoWindowBH.setContent(htmlbh);
                                                            infoWindowBH.setPosition(event.latLng);
                                                            infoWindowBH.open(map);
                                                        });
                                                    }
                                                    
                                                    // HIDROGRAFIA
                                                     
                                                     if (document.getElementById('checkhidrografia').checked == true) {
                                                      var cursos = new google.maps.Data();

                                                cursos.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/cursosdagua.geojson');

                                                cursos.setStyle({
                                                    strokeColor: '#AFC6ED',
                                                    fillOpacity: 0.12,
                                                    strokeWeight: 2.7
                                                });
                                                map: map
                                                cursos.setMap(map);
                                                createClickablePolyCursos(cursos, map);
                                            }
                                            function createClickablePolyCursos(poly, map) {
                                                var infoWindowCursos = new google.maps.InfoWindow();
                                                google.maps.event.addListener(poly, 'click', function(event) {
                                                     if (event.feature.getProperty("NORIOCOMP") == null) { 
                                                    var htmlcursos = '<h3 style="color:#3E77AB">' + "Sem Denominação" + '</h3>' + '<hr>';
                                                    htmlcursos += '<strong>Domínio:</strong> ' + event.feature.getProperty("DOMINIO") + '</br>';

                                                    }
                                                    else{
                                                     var htmlcursos = '<h3 style="color:#3E77AB">' + event.feature.getProperty("NORIOCOMP") + '</h3>' + '<hr>';
                                                     htmlcursos += '<strong>Domínio:</strong> ' + event.feature.getProperty("DOMINIO") + '</br>';
                                                    }
                                                    infoWindowCursos.setContent(htmlcursos);
                                                    infoWindowCursos.setPosition(event.latLng);
                                                    infoWindowCursos.open(map);
                                                });
                                                
                                                 var massasdagua = new google.maps.Data();
                                                massasdagua.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/massasdagua.geojson');
                                                
                                                massasdagua.setStyle(function(feature) {
                                              
                                                                var color = '#92BAFD';
                                                                var opacity = 0.4;
                                                                switch (feature.getProperty('NOME')){
                                                                case 'Oiticica (Projeto)':
                                                                color = '#0208ff';
                                                                opacity = 0.9
                                                                break;
                                                                }
                                                                return ({
                                                                 fillOpacity: opacity,
                                                                 fillColor: color,
                                                                 strokeWeight: 0.4,
                                                                 strokeColor: '#92BAFD'
                                                                })
                                                                
                                                   
                                                });
                                                map: map
                                                massasdagua.setMap(map);
                                                createClickablePolyMassas(massasdagua, map);

                                                function createClickablePolyMassas(poly, map) {
                                                    var infoWindowMassas = new google.maps.InfoWindow();
                                                    google.maps.event.addListener(poly, 'click', function(event) {
                                                    if (event.feature.getProperty("NOME") == null && event.feature.getProperty("link") == null ) {
                                                    
                                                        var htmlmassas = '<h3 style="color:#3E77AB">' + "Sem Denominação" + '</h3>' + '<hr>';
                                                        htmlmassas += '<strong>Tipo:</strong> ' + event.feature.getProperty("TIPO") + '</br>';
                                                        htmlmassas += '<strong>Monitorado:</strong> ' + event.feature.getProperty("Monitorado") + '</br>';
                                                        htmlmassas += '<strong>Link:</strong>' + " Sem link" + '</br>';

                                                        } else {
                                                        
                                                        var htmlmassas = '<h3 style="color:#3E77AB">' + event.feature.getProperty("NOME") + '</h3>' + '<hr>';
                                                        htmlmassas += '<strong>Tipo:</strong> ' + event.feature.getProperty("TIPO") + '</br>';
                                                        htmlmassas += '<strong>Monitorado:</strong> ' + event.feature.getProperty("Monitorado") + '</br>';
                                                        htmlmassas += '<strong>Link:</strong> '+ '<a target="_blank" href="' + event.feature.getProperty("link") + '">' + event.feature.getProperty("link") + '</a>'  + '</br>';

                                                        }
                                                        
                                                        
                                                        
                                                        
                                                        infoWindowMassas.setContent(htmlmassas);
                                                        infoWindowMassas.setPosition(event.latLng);
                                                        infoWindowMassas.open(map);
                                                    });
                                                }
                                                     }
                                                     
                                                     // ADUTORAS

                                               if (document.getElementById('checkadutoras').checked == true) {
                                                       var adutoras = new google.maps.Data();
                                                        adutoras.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/adutoras.geojson');
                                                       adutoras.setStyle(function(feature) {
                                                            var color = 'white';
                                                            
                                                            switch (feature.getProperty('Situação')){
                                                                case 'ADUTORA EXISTENTE':
                                                                color = '#0084a8';
                                                                break;
                                                                
                                                                case 'ADUTORA IMPLANTAÇÃO/CONCLUSÃO':
                                                                color = '#ffed00';
                                                                break;
                                                                
                                                                case 'ADUTORA DE ENGATE RÁPIDO EXISTENTE':
                                                                color = '#4ce600';
                                                                break;
                                                                
                                                                case 'ADUTORA EMERGENCIAL':
                                                                color = '#00ffc5';
                                                                break;
                                                                
                                                                case 'ADUTORAS A SEREM IMPLANTADAS':
                                                                color = '#ff0000';
                                                                break;
                                                                
                                                                
                                                                
                                                                
                                                            }
                                                            return ({
                                                                strokeColor: color,
                                                                strokeWeight: 2.8
                                                            })

                                                        });
                                                        map: map
                                                        adutoras.setMap(map);
                                                        createClickablePolyAdutoras(adutoras, map);
                                                        
                                                        //legenda Adutoras         
                                                        var legend = document.createElement('div');
                                                       legend.id = 'legendadultora';
                                                        var content = [];
                                                       
                                                        content.push('<h3>Adutoras</h3>' + '<hr>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/Adutoras/Aexistente.png"></img>&nbsp;&nbsp;Existente</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/Adutoras/AimplantaConc.png"></img>&nbsp;&nbsp;Em Fase de Conclusão/Implementação</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/Adutoras/AengateRap.png"></img>&nbsp;&nbsp;Engate Rápido Existente</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/Adutoras/Aemergencial.png"></img>&nbsp;&nbsp;Emergencial</div>' + '<br>');
                                                        content.push('<div class="col-lg-12"><img  style="margin-left:3px" src="images/Adutoras/AnaoImplantadas.png"></img>&nbsp;&nbsp;Não Implantada</div>' + '<br>');

                                                        legend.innerHTML = content.join('');
                                                        legend.index = 1;
                                                        map.controls[google.maps.ControlPosition.LEFT_TOP].push(legend);
                                                    

                                                                    
                                                        function createClickablePolyAdutoras(poly, map) {
                                                            var infoWindowAdutoras = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(poly, 'click', function(event) {
                                                                var htmlad = '<h3 style="color:#3E77AB">' + event.feature.getProperty("Adutora") + '</h3>' + '<hr>';
                                                                htmlad += '<strong>Atendimento populacional:</strong> ' + event.feature.getProperty("POPATEND") + '</br>'+ '</br>';
                                                                htmlad += '<strong>Captação:</strong> ' + event.feature.getProperty("CAPTAÇÃO") + '</br>'+ '</br>';
                                                                htmlad += '<strong>Extensão:</strong> ' + event.feature.getProperty("EXTENSÃO") + '</br>'+ '</br>';
                                                                htmlad += '<strong>Vazão(m<sup>3</sup>/h):</strong> ' + event.feature.getProperty("VAZÃO") + '</br>'+ '</br>';
                                                                htmlad += '<strong>Situação:</strong> ' + event.feature.getProperty("Situação") + '</br>'+ '</br>';
                                                                htmlad += '<strong>Construção:</strong> ' + event.feature.getProperty("Construcao") + '</br>'+ '</br>';

                                                                infoWindowAdutoras.setContent(htmlad);
                                                                infoWindowAdutoras.setPosition(event.latLng);
                                                                infoWindowAdutoras.open(map);
                                                            });
                                                        }
                                                        
                                                    }
                                                    //PCD's
                                                    
                                         if (document.getElementById('checkpcd').checked == true) {

                                                        var pcds = new google.maps.Data();
                                                        pcds.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/pcds.geojson');
                                                 
                                                        map: map
                                                        pcds.setMap(map);
                                                        
                                                        createClickableMarkerPCDS(pcds, map);
                                                        
                                                        pcds.setStyle(function(feature){
                                                        var iconepc;
                                                        if(feature.getProperty('PROPRIETAR')=='SEMARH-RN'){
                                                        iconepc='images/marcadores/pcdSEMARH.png';
                                                        }else{
                                                        iconepc='images/marcadores/pcd.png';
                                                        }
                                                        
                              
                                    
                                                        return({
		                                                    icon: iconepc
		                                                    })
                                                        });
                                                        
                                                        

                                                      
                                                       function createClickableMarkerPCDS(marker, map) {
                                                            var infoWindowPcds = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                                var htmlpcd = '<h3 style="color:#3E77AB">' + event.feature.getProperty("NOME_DA_PC") + '</h3>' + '<hr>';
                                                                htmlpcd += '<strong>Código:</strong> ' + event.feature.getProperty("CODIGO") + '</br>';
                                                                htmlpcd += '<strong>Proprietário:</strong> ' + event.feature.getProperty("PROPRIETAR") + '</br>';
                                                                if (event.feature.getProperty("LINK_ANA") == null) {
                                                        htmlpcd += '<strong>Link da ANA:</strong>' + " Sem link" + '</br>';
                                                        
                                                        } else {
                                                        htmlpcd += '<strong>Link da ANA:</strong> '+ '<a target="_blank" href="' + event.feature.getProperty("LINK_ANA") + '">' + event.feature.getProperty("LINK_ANA") + '</a>'  + '</br>';
                                                         }
                                                                
                                                                infoWindowPcds.setContent(htmlpcd);
                                                                infoWindowPcds.setPosition(event.latLng);
                                                                infoWindowPcds.open(map);
                                                            });
                                                      }  
                                                    }
                                                //Outorgas
                                                    
                                         if (document.getElementById('checkoutorgas').checked == true) {

                                                        var outorgasana = new google.maps.Data();
                                                        outorgasana.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/outorgas.ana.geojson');
                                                       
                                                        map: map
                                                        outorgasana.setMap(map);
                                                           
                                                        createClickableMarkerOutorgasana(outorgasana, map);
                                                        
                                                        outorgasana.setStyle(function(feature){
                                                        var iconeout;
                                                        iconeout='images/marcadores/OutorgasAna.png';
                                                        return({
		                                                    icon: iconeout
		                                                    })
                                                        });
                                                      
                                                       function createClickableMarkerOutorgasana(marker, map) {
                                                            var infoWindowOutorgasAna = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                                var htmloutorgasAna = '<h3 style="color:#3E77AB">' + event.feature.getProperty("CODIGO_CNA") + '</h3>' + '<hr>';
                                                                htmloutorgasAna += '<strong>Requerente:</strong> ' + event.feature.getProperty("NOME_DO_RE") + '</br>';
                                                                htmloutorgasAna += '<strong>Fonte:</strong> ' + event.feature.getProperty("CORPO_HIDR") + '</br>';
                                                                htmloutorgasAna += '<strong>Uso Principal:</strong> ' + event.feature.getProperty("USO_PRINCI") + '</br>';
                                                                htmloutorgasAna += '<strong>Tipo de Interferância:</strong> ' + event.feature.getProperty("TIPO_INTER") + '</br>';
                                                                htmloutorgasAna += '<strong>Resolução:</strong> ' + event.feature.getProperty("RESOLUCAO") + '</br>';
                                                                htmloutorgasAna += '<strong>Data de Vencimento:</strong> ' + event.feature.getProperty("DATA_DE_V") + '</br>';
                                                                htmloutorgasAna += '<strong>Categoria:</strong> ' + event.feature.getProperty("CATEGORIA") + '</br>';
                                                                htmloutorgasAna += '<strong>Área Plantada:</strong> ' + event.feature.getProperty("AREA_PLANT") + '</br>';
                                                                htmloutorgasAna += '<strong>Método de Irrigação:</strong> ' + event.feature.getProperty("METODO_IRR") + '</br>';
                                                                htmloutorgasAna += '<strong>Cultura Irrigada:</strong> ' + event.feature.getProperty("CULTURA_IR") + '</br>';
                                                                htmloutorgasAna += '<strong>Vazão (m³/h):</strong> ' + event.feature.getProperty("VAZAO_M3_H") + '</br>';
                                                                htmloutorgasAna += '<strong>Concentração de DBO (mg/l):</strong> ' + event.feature.getProperty("DBO_MG_L") + '</br>';
                                                                htmloutorgasAna += '<strong>Concentração de P (mg/l):</strong> ' + event.feature.getProperty("P_MG_L") + '</br>';
                                                                
                                                                infoWindowOutorgasAna.setContent(htmloutorgasAna);
                                                                infoWindowOutorgasAna.setPosition(event.latLng);
                                                                infoWindowOutorgasAna.open(map);
                                                            });
                                                          
                                                          
                                                          var outorgasigarnobras = new google.maps.Data();
                                                        outorgasigarnobras.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/outorgas.obra.igarn.geojson');
                                                       
                                                        map: map
                                                        outorgasigarnobras.setMap(map);
                                                           
                                                        createClickableMarkerOutorgasIgarnObras(outorgasigarnobras, map);
                                                        
                                                        
                                                        outorgasigarnobras.setStyle(function(feature){
                                                        var iconeoutigarnobras;
                                                        iconeoutigarnobras='images/marcadores/Outorgas.png';
                                                        return({
		                                                    icon: iconeoutigarnobras
		                                                    })
                                                        });
                                                      
                                                       function  createClickableMarkerOutorgasIgarnObras(marker, map) {
                                                            var infoWindowOutorgasIgarnObras = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                                var htmloutorgasIgarObras = '<h3 style="color:#3E77AB">' + event.feature.getProperty("NUM_LICENS") + '</h3>' + '<hr>';
                                                                htmloutorgasIgarObras += '<strong>Requerente:</strong> ' + event.feature.getProperty("Nome_Reque") + '</br>';
                                                                htmloutorgasIgarObras += '<strong>Nº da Outorga:</strong> ' + event.feature.getProperty("NUM_LICENS") + '</br>';
                                                                htmloutorgasIgarObras += '<strong>Tipo da Obra:</strong> ' + event.feature.getProperty("TIPO_OBRA") + '</br>';
                                                                htmloutorgasIgarObras += '<strong>Fonte:</strong> ' + event.feature.getProperty("FONTE") + '</br>';
                                                                
                                                                
                                                                infoWindowOutorgasIgarnObras.setContent(htmloutorgasIgarObras);
                                                                infoWindowOutorgasIgarnObras.setPosition(event.latLng);
                                                                infoWindowOutorgasIgarnObras.open(map);
                                                            });
                                                            
                                                             var outorgasigarndis = new google.maps.Data();
                                                        outorgasigarndis.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/outorgas.dispensa.igarn.geojson');
                                                        map: map
                                                        outorgasigarndis.setMap(map);
                                                           
                                                        createClickableMarkerOutorgasIgarnDis(outorgasigarndis, map);
                                                        
                                                        outorgasigarndis.setStyle(function(feature){
                                                        var iconeoutigarndis;
                                                        iconeoutigarndis='images/marcadores/OutorgasIgarnDispensa.png';
                                                        return({
		                                                    icon: iconeoutigarndis
		                                                    })
                                                        });
                                                      
                                                       function  createClickableMarkerOutorgasIgarnDis(marker, map) {
                                                            var infoWindowOutorgasIgarnDis = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                                var htmloutorgasIgarDis = '<h3 style="color:#3E77AB">' + event.feature.getProperty("NUM_DISPEN") + '</h3>' + '<hr>';
                                                                htmloutorgasIgarDis += '<strong>Requerente:</strong> ' + event.feature.getProperty("NOME_REQUE") + '</br>';
                                                                htmloutorgasIgarDis += '<strong>Data de Expedição:</strong> ' + event.feature.getProperty("DATA_EXPED") + '</br>';
                                                                htmloutorgasIgarDis += '<strong>Tipo da Obra:</strong> ' + event.feature.getProperty("TIPO_OBRA") + '</br>';
                                                                htmloutorgasIgarDis += '<strong>Fonte:</strong> ' + event.feature.getProperty("FONTE") + '</br>';
                                                                htmloutorgasIgarDis += '<strong>Uso Principal:</strong> ' + event.feature.getProperty("USO_AGUA") + '</br>';
                                                                htmloutorgasIgarDis += '<strong>Área Plantada:</strong> ' + event.feature.getProperty("AREA_IRRIG") + '</br>';
                                                                htmloutorgasIgarDis += '<strong>Vazão (m³/dia):</strong> ' + event.feature.getProperty("VAZAO_M3_D") + '</br>';
                                                                htmloutorgasIgarDis += '<strong>Validade:</strong> ' + event.feature.getProperty("VALIDADE") + '</br>';
                                                                
                                                                
                                                                infoWindowOutorgasIgarnDis.setContent(htmloutorgasIgarDis);
                                                                infoWindowOutorgasIgarnDis.setPosition(event.latLng);
                                                                infoWindowOutorgasIgarnDis.open(map);
                                                            });
                                                            
                                                            var outorgasigarnuso = new google.maps.Data();
                                                        outorgasigarnuso.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/outorgas.uso.igarn.geojson');
                                                        map: map
                                                        outorgasigarnuso.setMap(map);
                                                           
                                                        createClickableMarkerOutorgasIgarnUso(outorgasigarnuso, map);
                                                        
                                                        outorgasigarnuso.setStyle(function(feature){
                                                       
                                                        var iconeoutigarnuso;
                                                        iconeoutigarnuso='images/marcadores/OutorgasUso.png';
                                                        return({
		                                                    icon: iconeoutigarnuso
		                                                    })
                                                        });
                                                      
                                                       function  createClickableMarkerOutorgasIgarnUso(marker, map) {
                                                            var infoWindowOutorgasIgarnUso = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                                var htmloutorgasIgarUso = '<h3 style="color:#3E77AB">' + event.feature.getProperty("NUM_OUTORG") + '</h3>' + '<hr>';
                                                                htmloutorgasIgarUso += '<strong>Requerente:</strong> ' + event.feature.getProperty("Nome_Reque") + '</br>';
                                                                htmloutorgasIgarUso += '<strong>Data de Vencimento:</strong> ' + event.feature.getProperty("DATA_VALID") + '</br>';
                                                                htmloutorgasIgarUso += '<strong>Uso Principal:</strong> ' + event.feature.getProperty("USO_PRINCI") + '</br>';
                                                                htmloutorgasIgarUso += '<strong>Fonte:</strong> ' + event.feature.getProperty("FONTE") + '</br>';
                                                                htmloutorgasIgarUso += '<strong>Área irrigada (ha):</strong> ' + event.feature.getProperty("AREA_IRRIG") + '</br>';
                                                                htmloutorgasIgarUso += '<strong>Vazão (m³/dia):</strong> ' + event.feature.getProperty("TOTAL_VAZA") + '</br>';
                                                                htmloutorgasIgarUso += '<strong>Declaração CNARH:</strong> ' + event.feature.getProperty("DECL_CNARH") + '</br>';
                                                                
                                                                
                                                                infoWindowOutorgasIgarnUso.setContent(htmloutorgasIgarUso);
                                                                infoWindowOutorgasIgarnUso.setPosition(event.latLng);
                                                                infoWindowOutorgasIgarnUso.open(map);
                                                            });
                                                            
                                                      }  
                                                      
                                            }        
                                            }
                                            }
                                            }
                                            
                                            //Monitoramento
                                                    
                                                     if (document.getElementById('checkmonitoramento').checked == true) {
                                                        
                                                        var monitoramentosuperficial = new google.maps.Data();
                                                        monitoramentosuperficial.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/monitoramento.superficial.geojson');
                                                       
                                                        map: map
                                                        monitoramentosuperficial.setMap(map);
                                                        createClickableMarkerMonitoramentoSup(monitoramentosuperficial, map);
                                                        
                                                        monitoramentosuperficial.setStyle(function(feature){
                                                        var iconemonitorasup;
                                                        iconemonitorasup='images/marcadores/MonitoramentoSup.png';
                                                        return({
		                                                    icon: iconemonitorasup
		                                                    })
                                                        }); 
                                                      
                                                       function createClickableMarkerMonitoramentoSup(marker, map) {
                                                            var infoWindowMoniSup = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                                var htmlmoniSup = '<h3 style="color:#3E77AB">' + event.feature.getProperty("CODIGO") + '</h3>' + '<hr>';
                                                                htmlmoniSup += '<strong>Localidade:</strong> ' + event.feature.getProperty("LOCALIZA") + '</br>';
                                                                htmlmoniSup += '<strong>Rio Principal:</strong> ' + event.feature.getProperty("RIO_PRIN") + '</br>';
                                                                htmlmoniSup += '<strong>Riacho:</strong> ' + event.feature.getProperty("RIACHO") + '</br>';
                                                                htmlmoniSup += '<strong>Presença de Agrotóxico:</strong> ' + event.feature.getProperty("AGROTOXI") + '</br>';
                                                                htmlmoniSup += '<strong>Presença de Sedimentos:</strong> ' + event.feature.getProperty("SEDIMENT") + '</br>';
                                                                htmlmoniSup += '<strong>Amostragem:</strong> ' + event.feature.getProperty("AMOSTRAG") + '</br>';
                                                                htmlmoniSup += '<strong>Responsável:</strong> ' + event.feature.getProperty("RESPONSA") + '</br>';
                                                                
                                                                
                                                                
                                                                infoWindowMoniSup.setContent(htmlmoniSup);
                                                                infoWindowMoniSup.setPosition(event.latLng);
                                                                infoWindowMoniSup.open(map);
                                                            
                                                            });
                                                           
                                                            var monitoramentosubterraneo = new google.maps.Data();
                                                        monitoramentosubterraneo.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/monitoramento.subterraneo.geojson');
                                                       
                                                        map: map
                                                        monitoramentosubterraneo.setMap(map);
                                                        createClickableMarkerMonitoramentoSub(monitoramentosubterraneo, map);
                                                        
                                                        monitoramentosubterraneo.setStyle(function(feature){
                                                        var iconemonitorasub;
                                                        iconemonitorasub='images/marcadores/MonitoramentoSub.png';
                                                        return({
		                                                    icon: iconemonitorasub
		                                                    })
                                                        }); 
                                                      
                                                       function createClickableMarkerMonitoramentoSub(marker, map) {
                                                            var infoWindowMoniSub = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                                var htmlmoniSub = '<h3 style="color:#3E77AB">' + event.feature.getProperty("CODIGO") + '</h3>' + '<hr>';
                                                                htmlmoniSub += '<strong>Localidade:</strong> ' + event.feature.getProperty("LOCALIZA") + '</br>';
                                                                
                                                                
                                                                
                                                                infoWindowMoniSub.setContent(htmlmoniSub);
                                                                infoWindowMoniSub.setPosition(event.latLng);
                                                                infoWindowMoniSub.open(map);
                                                            
                                                            });
                                                           }
                                                           }
                                                           }
														   
														   //Barragens

                                                    if (document.getElementById('checkbarragens').checked == true) {
                                                        var barragens = new google.maps.Data();
                                                        barragens.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/barragens.igarn.geojson');
                                                        

                                                        map: map
                                                        barragens.setMap(map);
                                                        createClickableMarkerBarragens(barragens, map);
                                                        
                                                         barragens.setStyle(function(feature){
                                                        var iconebar;
                                                        if(feature.getProperty('dominio')=='Público'){
                                                        iconebar='images/marcadores/Barragens.png';
                                                        }
                                                        if(feature.getProperty('dominio')=='Sem informação'){
                                                        iconebar='images/marcadores/Barragensseminfo.png';
                                                        }
                                                        if(feature.getProperty('dominio')=='Privado'){
                                                        iconebar='images/marcadores/Barragensprivadas.png';
                                                        }
                                                        
                                                        
                                                        
                              
                                    
                                                        return({
		                                                    icon: iconebar
		                                                    })
                                                        });

                                                        function createClickableMarkerBarragens(marker, map) {
                                                           
                                                            var infoWindowBarragens = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                            var htmlbar = '<h3 style="color:#3E77AB">' + event.feature.getProperty("Nome") + '</h3>' + '<hr>';
                                                                htmlbar += '<strong>Altura Acima do Nível do Terreno:</strong> ' + event.feature.getProperty("Alt_AcTe") + '</br>';
                                                                htmlbar += '<strong>Capacidade:</strong> ' + event.feature.getProperty("Capacida") + '</br>';
                                                                htmlbar += '<strong>Principal Comprimento:</strong> ' + event.feature.getProperty("Prin_com") + '</br>';
                                                                htmlbar += '<strong>Empreendedor:</strong> ' + event.feature.getProperty("Empreend") + '</br>';
                                                                htmlbar += '<strong>Data da Construção:</strong> ' + event.feature.getProperty("Data_con") + '</br>';
																htmlbar += '<strong>Uso Principal:</strong> ' + event.feature.getProperty("Uso_prin") + '</br>';
                                                                htmlbar += '<strong>Data da Última Inspeção:</strong> ' + event.feature.getProperty("Data_Ins") + '</br>';
                                                                if (event.feature.getProperty("Tipo_Ins") == null) {
                                                        htmlbar += '<strong>Tipo da Última Inspenção:</strong>' + "Sem Informação" + '</br>';
                                                        } else {
                                                        htmlbar +='<strong>Tipo da Última Inspenção:</strong> ' + event.feature.getProperty("Tipo_Ins") + '</br>'; 
                                                         }
                                                                htmlbar += '<strong>Nível de Perigo:</strong> ' + event.feature.getProperty("Niv_Peri") + '</br>';
																htmlbar += '<strong>Dano Potencial Associado:</strong> ' + event.feature.getProperty("Dan_PotA") + '</br>';
                                                                htmlbar += '<strong>Classe:</strong> ' + event.feature.getProperty("Classe") + '</br>';
                                                                htmlbar += '<strong>Vazão do Projeto:</strong> ' + event.feature.getProperty("Vaz_Proj") + '</br>';
                                                                infoWindowBarragens.setContent(htmlbar);
                                                                infoWindowBarragens.setPosition(event.latLng);
                                                                infoWindowBarragens.open(map);
                                                            });
                                                        }
                                                    }
                                                    //PSP-Barragens subterrâneas
                                                           if (document.getElementById('checkbarsub').checked == true) {
                                                        var barsub = new google.maps.Data();
                                                        barsub.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/barragens_sub_semarh_rn.geojson');
                                                        

                                                        map: map
                                                        barsub.setMap(map);
                                                        createClickableMarkerBarragensSub(barsub, map);
                                                        
                                                         barsub.setStyle(function(feature){
                                                        var iconebarsub;
                                                            iconebarsub='images/marcadores/Barsub.png';
                                                        
                                                       return({
		                                                    icon: iconebarsub
		                                                    })
                                                        });

                                                        function createClickableMarkerBarragensSub(marker, map) {
                                                           
                                                            var infoWindowBarragensSub = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                            var htmlbarsub = '<h3 style="color:#3E77AB">' + event.feature.getProperty("Localizaç") + '</h3>' + '<hr>';
                                                                htmlbarsub += '<strong>Localidade:</strong> ' + event.feature.getProperty("Comunidade") + '</br>';
                                                                htmlbarsub += '<strong>Beneficiário:</strong> ' + event.feature.getProperty("Beneficiar") + '</br>';
                                                                
                                                                infoWindowBarragensSub.setContent(htmlbarsub);
                                                                infoWindowBarragensSub.setPosition(event.latLng);
                                                                infoWindowBarragensSub.open(map);
                                                            });
                                                        }
                                                    }
                                                      //ETE'S
                                                      if (document.getElementById('checkete').checked == true) {
                                                        var ete = new google.maps.Data();
                                                        ete.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/ete_caern_rn.geojson');
                                                        

                                                        map: map
                                                        ete.setMap(map);
                                                        createClickableMarkerEte(ete, map);
                                                        
                                                         

                                                        function createClickableMarkerEte(marker, map) {
                                                           
                                                            var infoWindowEte = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                            var htmlete = '<h3 style="color:#3E77AB">' + event.feature.getProperty("DEN") + '</h3>' + '<hr>';
                                                                htmlete += '<strong>Localidade:</strong> ' + event.feature.getProperty("END") + '</br>';
                                                                htmlete += '<strong>Ano de Ativação:</strong> ' + event.feature.getProperty("AAT") + '</br>';
                                                                htmlete += '<strong>Vazão de Projeto:</strong> ' + event.feature.getProperty("VPR") + '</br>';
                                                                htmlete += '<strong>Vazão Atual de Operação:</strong> ' + event.feature.getProperty("VAO") + '</br>';
                                                                htmlete += '<strong>Tipo de Tratamento:</strong> ' + event.feature.getProperty("TTR") + '</br>';
                                                                htmlete += '<strong>Destino:</strong> ' + event.feature.getProperty("DES") + '</br>';
                                                                htmlete += '<strong>Regional:</strong> ' + event.feature.getProperty("REG") + '</br>';
                                                                
                                                                infoWindowEte.setContent(htmlete);
                                                                infoWindowEte.setPosition(event.latLng);
                                                                infoWindowEte.open(map);
                                                            });
                                                        }
                                                    }     
                                                    //ETA's
                                                    if (document.getElementById('checketa').checked == true) {
                                                        var eta = new google.maps.Data();
                                                        eta.loadGeoJson('https://raw.githubusercontent.com/pedroscp7/Mapas-GeoJson/master/eta_caern_rn.geojson');
                                                        

                                                        map: map
                                                        eta.setMap(map);
                                                        createClickableMarkerEta(eta, map);
                                                        
                                                         

                                                        function createClickableMarkerEta(marker, map) {
                                                           
                                                            var infoWindowEta = new google.maps.InfoWindow();
                                                            google.maps.event.addListener(marker, 'click', function(event) {
                                                            var htmleta = '<h3 style="color:#3E77AB">' + event.feature.getProperty("DEN") + '</h3>' + '<hr>';
                                                                htmleta += '<strong>Localidade:</strong> ' + event.feature.getProperty("END") + '</br>';
                                                                htmleta += '<strong>Ano de Ativação:</strong> ' + event.feature.getProperty("AAT") + '</br>';
                                                                htmleta += '<strong>Vazão de Projeto:</strong> ' + event.feature.getProperty("VPR") + '</br>';
                                                                htmleta += '<strong>Vazão Atual de Operação:</strong> ' + event.feature.getProperty("VAO") + '</br>';
                                                                htmleta += '<strong>Tipo de Tratamento:</strong> ' + event.feature.getProperty("TTR") + '</br>';
                                                                htmleta += '<strong>Regional:</strong> ' + event.feature.getProperty("REG") + '</br>';
                                                                
                                                                infoWindowEta.setContent(htmleta);
                                                                infoWindowEta.setPosition(event.latLng);
                                                                infoWindowEta.open(map);
                                                            });
                                                        }
                                                    }     
                                                           }
                                            
                                                   
                                            
                                            
                                            
                                          

                                                
                                                
                                            </script>

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
                                                        <img src="images/marcadores/pocos.png" />Poços SEMARH<br />
                                                        <img src="images/marcadores/pocoIncra.png" />Poços INCRA<br />
                                                        <img src="images/marcadores/pocosCAERN.png" />Poços CAERN<br />
                                                         <img src="images/marcadores/pocosSEMARH2016.png" />Poços SEMARH 2016<br />
                                                        <img src="images/marcadores/pocosSEMARHNInstalados.png" />Poços SEMARH (Não Instalados)<br />
                                                        <img src="images/marcadores/dessalinizadores.png" />PAD - Dessalinizadores<br />
                                                        <img src="images/marcadores/OutorgasAna.png" />Outorgas - ANA<br />
                                                        <img src="images/marcadores/Outorgas.png" />Outorgas - IGARN (Uso e Obras)<br />
                                                        <img src="images/marcadores/OutorgasIgarnDispensa.png" />Outorgas - IGARN (Dispensa)<br />
                                                        <img src="images/marcadores/MonitoramentoSub.png" />Pontos de Monitramento Subterrâneos<br />
                                                        <img src="images/marcadores/MonitoramentoSup.png" />Pontos de Monitramento Superficiais<br />
                                                        <img src="images/marcadores/Barragens.png" />Barragens de Domínio Público<br />
                                                        <img src="images/marcadores/Barragensprivadas.png" />Barragens de Domínio Privado<br />
                                                        <img src="images/marcadores/Barragensseminfo.png" />Barragens sem informação de
                                                        Domínio<br />
                                                        <img src="images/marcadores/Barsub.png" />PSP - Barragens Subterraneas<br />
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
