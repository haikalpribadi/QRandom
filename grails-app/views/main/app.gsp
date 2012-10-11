<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main">
    <g:javascript src="application.js"/>
    <title>${title}</title>
  </head>
  <body>
    <table class="contentLayout" cellpadding="0" cellspacing="0">
      <tr>
        <td class="contentTitle">
          A Quantum Random Number Generator
        </td>
      </tr>
      <tr>
        <td class="contentBody">
          <div class="contentBodyApp">
            <p style="width:550px;margin:5px auto;">
              A true random number generator, generated from the IDQ Quantis device.
            </p>
            <g:form id="generate" name="generate" url="[controller:'main',action:'app']">
              <div class="field round-s">
                Data type to generate
                <select id="type" name="type">
                  <option value="binary">Binary data (only to file)</option>
                  <option value="integer">Integer numbers</option>
                  <option value="float">Floating point numbers</option>
                  <option value="double">Double Floating point numbers</option>
                </select>
              </div>
              <div id="formatfield" class="field round-s">
                Output format of data
                <select id="format" name="format">
                  <option value="csv">Comma-separated values (CSV)</option>
                  <option value="line">One entry per line</option>
                </select>
              </div>
              <div id="scalefields" class="field round-s">
                <table cellpadding="0" cellspacing="0" style="margin:0px; height:40px; width:100%;">
                  <tr id="scalerow">
                    <td id="scalecheck">
                      <input id="scale" name="scale" type="checkbox" style="line-height:12px;">&nbsp;<label for="scale">Scale data between</label>
                    </td>
                    <td id="minscalecell" class="fieldpart fade" style="width:190px;">
                      <input id="minscale" name="minscale" type="text" value="0" disabled="true">
                    </td>
                    <td id="scaletocell"class="fieldpart fade" style="width:22px;text-align:center;">
                      to
                    </td>
                    <td id="maxscalecell" class="fieldpart fade" style="width:190px;text-align:right;">
                      <input id="maxscale" name="maxscale" type="text" value="1000" disabled="true">
                    </td>
                  </tr>
                </table>
              </div>
              <div class="field round-s">
                Amount of data (in bytes) to read (max: 5MB)
                <input id="size" name="size" type="text" value="1024">
              </div>
              <div class="field round-s" style="text-align: center;padding-right:10px;width:680px">
                <p style="margin:auto;">
                  <span id="optiondisplay">
                    <input id="outputdisplay" type="radio" class="radiobutton" name="output" value="display" checked="true">
                    &nbsp;<label for="outputdisplay">Display data</label>&nbsp;&nbsp;&nbsp;&nbsp;
                  </span>
                  <input id="outputfile" type="radio" class="radiobutton" name="output" value="file">
                  <label for="outputfile">Save to file</label>
                </p>
              </div>
              <p id="errormessage" style="display:block;">
                Javascript has to be enabled to use this application!
              </p>
              <input type="hidden" id="token" name="token"/>
              <p>
              <g:submitToRemote update="displayarea" url="[controller:'main', action:'app']"
                                onLoading="startLoadData()" onComplete="completeLoadData()"
                                value="Generate to display" id="submitremotebutton" class="submitbutton" />
              <input id="submitbutton" type="submit" value="Generate to file" class="submitdisabled" disabled="disabled"/>
              </p>
              <p id="loading">
                <img src="${resource(dir: 'images', file: 'loading.gif')}" alt="Processing ..." width="220px"/>
              </p>
            </g:form>

            <div id="apifield" class="fieldgreen round-s">
              <p>
                Web API for the current request:
              </p>
              <p id="apiurl">
              </p>
            </div>
            <div id="displayfield" class="fieldlarge round-s">
              <a href="#" id="copyclip" class="round-s" onclick="">Copy to clipboard</a>
              <textarea id="displayarea" readonly="true" rows="40">
${result}
              </textarea>
            </div>
          </div>
        </td>
      </tr>
    </table>
  </body>
</html>
