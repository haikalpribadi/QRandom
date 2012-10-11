<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title><g:layoutTitle default="QRandom"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="index, follow">
    <meta name="keywords" content="QRandom, Random number generator, random number, quantum random number, School of Infotech , Monash , University, Sunway, Campus">
    <meta name="description" content="Behold QRandom! A Quantum Random Number Generator. A true random number generator, generated from the IDQ Quantis device.">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
  <g:javascript library="jquery"/>
  <r:layoutResources />
  <g:javascript src="jquery.cookie.js"/>
  <g:layoutHead/>
</head>
<body>
  <div id="navigationPanelBG">
    <ul id="navigationList">
      <li><div class="navigationListItem"/></li>
      <li><div class="navigationListItem"/></li>
      <li><div class="navigationListItem"/></li>
      <li><div class="navigationListItem"/></li>
      <li><div class="navigationListItem"/></li>
    </ul>
  </div>
  <div id="navigationPanel">
    <ul id="navigationList">
      <li>
        <div class="navigationListItem <g:currentPage test='index'/>">
          <a href="/" class="navigationLink">Home</a>
          <div class="navigationListItemIndicator" />
        </div>
      </li>
      <li>
        <div class="navigationListItem <g:currentPage test='app'/>">
          <a href="/app" class="navigationLink">Generator</a>
          <div class="navigationListItemIndicator" />
        </div>
      </li>
      <li>
        <div class="navigationListItem <g:currentPage test='tutorials'/>">
          <a href="/tutorials" class="navigationLink">Tutorials</a>
          <div class="navigationListItemIndicator" />
        </div>
      </li>
      <li>
        <div class="navigationListItem <g:currentPage test='statistics'/>">
          <a href="/statistics" class="navigationLink">Statistics</a>
          <div class="navigationListItemIndicator" />
        </div>
      </li>
      <li>
        <div class="navigationListItem">
          <a href="http://www.monash.edu.my/" class="navigationLink" target="_blank"><em>visit Monash Universty</em></a>
          <div class="navigationListItemIndicator" />
        </div>
      </li>
    </ul>
  </div>
  <div class="contentcontainer round">
    <div id="logo-qrandom" role="banner">
      <a href="/" style="vertical-align:bottom;display:block;padding:10px 0px 0px 0px;width:300px;margin:auto;">
        <img src="${resource(dir:'images', file:'qrandom_logo_orange.png')}" alt="QRandom" width="300px"/>
      </a>
    </div>
    <div class="contentborder">
      <div class="content">
        <g:layoutBody/>
      </div>
    </div>
    <div id="footer-qrandom">
      <p style="text-align: left;">&copy; 2012, QRandom. All rights reserved. | <a href="#">Privacy</a> | <a href="#">Terms</a> | <a href="#">Developers</a>
        <a href="#" id="moniker">by CodeCrafter</a>
      </p>
    </div>
  </div>
</body>
</html>