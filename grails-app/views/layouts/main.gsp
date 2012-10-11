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
  <div class="wrapper">
    <div class="header">
      <div style="background:#fff; height:80px;">
        <div style="float:left;">
          <a href="http://infotech.monash.edu.my/" title="Monash University">
            <img src="${resource(dir:'images', file:'monash_logo.png')}" alt="Monash University"/>
          </a>
        </div>
        <div style="float:right;">
          <img src="${resource(dir:'images', file:'banner_currentstudents.jpg')}" alt="Current Students"/>
        </div>
      </div>
      <div class="monash_menu">
        <ul>
          <li>
            <a href="http://www.monash.edu/about/">
              About Monash
            </a>
          </li>
          <li>
            <a href="http://www.monash.edu.my/advancement/about/index.htm">
              Monash in Malaysia
            </a>
          </li>
          <li>
            <a href="http://www.monash.edu.my/Schools.htm">
              Schools
            </a>
          </li>
          <li>
            <a href="http://monash.edu/study/campuses/">
              Campuses
            </a>
          </li>
          <li>
            <a href="http://www.monash.edu.my/contact.htm">
              Contact Monash
            </a>
          </li>
        </ul>
      </div>
      <div class="search_menu">
        <div style="float:right;margin:4px">
          <form id="cse-search-box" action="http://search.monash.edu">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tbody>
                <tr>
                  <td style="width:170px;">
                    <a href="http://www.monash.edu.my/staffdir.htm" style="text-decoration:none;color:black;">
                      Staff directory
                    </a> | 
                    <a href="http://infotech.monash.edu.my/component/option,com_xmap/Itemid,191/sitemap,1/" style="text-decoration:none;color:black;">
                      Site map
                    </a>
                  </td>
                  <td style="width:50px; color:black;"><b>Search</b></td>
                  <td>
                    <input value="FORID:11" name="cof" type="hidden">
                    <select id="cx" name="cx">
                      <option value="001621737867968046729:nsl4i5alcty">All of Monash</option>
                      <option selected="selected" value="001621737867968046729:z4ecaamn3t4">Sunway Campus</option>
                    </select></td>
                  <td height="px" align="right" width="145"><input class="searchbox" autocomplete="on" name="q" id="q" title="search" type="text" width="30"></td><td width="8"></td>
                  <td height="px" align="center" width="1"><input value="Find" type="submit"></td>
                </tr>
              </tbody>
            </table>
          </form>
        </div>
      </div>
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
    <div class="contentcontainer">
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
        <p style="text-align: left;">
          <a href="#" id="moniker">by HaikalPribadi</a>
        </p>
      </div>
    </div>
    <div class="footer">
      <a href="http://www.copyright.monash.edu.au/"> Copyright</a>
      © 2011 <a href="http://www.monash.edu.my/">Monash University Sunway Campus</a> 
      (Co. No. : 458601-U) KP(JPS)/5195/US/595(16)KP/JPS/DFT/US/B04 - 
      <a href="http://www.monash.edu.my/disclaimer.htm"> Caution</a>
      <br>
      Last updated: 7 June 2012 - Maintained by <a href="mailto:webmaster-infotech@infotech.monash.edu.my">InfoTech</a>
    </div>
  </div>
</body>
</html>