
var isloading = false;
function setScaleFields(){
    var checked = $("#scale").attr("checked");
    if(checked=="checked"){
        $("#minscalecell").fadeTo("normal", 1);
        $("#minscale").attr("disabled",false);
        $("#maxscalecell").fadeTo("normal", 1);
        $("#maxscale").attr("disabled",false);
        $("#scaletocell").fadeTo("normal", 1);
    }
    else{
        $("#minscalecell").fadeTo("normal", 0.3);
        $("#minscale").attr("disabled",true);
        $("#maxscalecell").fadeTo("normal", 0.3);
        $("#maxscale").attr("disabled",true);
        $("#scaletocell").fadeTo("normal", 0.3);
    }
}

function setTypeOptions(){
    var value = $("#type").attr("value");
    if(value=="binary"){
        $("[name=output]").filter("[value=file]").attr("checked",true);
        $("[name=output]").filter("[value=display]").attr("disabled",true);
        $("#format").attr("value","csv");
        $("#format").attr("disabled", true);
        $("#formatfield").fadeTo("normal", 0.5);
        $("#optiondisplay").fadeTo("normal", 0.5);
        $("#scale").attr("checked",false);
        $("#scale").attr("disabled",true);
        $("#minscalecell").fadeTo("normal", 1);
        $("#minscale").attr("disabled",true);
        $("#maxscalecell").fadeTo("normal", 1);
        $("#maxscale").attr("disabled",true);
        $("#scaletocell").fadeTo("normal", 1);
        $("#scalefields").fadeTo("normal",0.5);
    }
    else if(value=="integer"){
        $("[name=output]").filter("[value=display]").attr("disabled",false);
        $("#format").attr("disabled", false);
        $("#formatfield").fadeTo("normal", 1);
        $("#optiondisplay").fadeTo("normal", 1);
        $("#scalefields").fadeTo("normal",1);
        $("#scale").attr("disabled",false);
        setScaleFields();
    }
    else if(value=="float" || value=="double"){
        $("[name=output]").filter("[value=display]").attr("disabled",false);
        $("#format").attr("disabled", false);
        $("#formatfield").fadeTo("normal", 1);
        $("#optiondisplay").fadeTo("normal", 1);
        $("#scalefields").fadeTo("normal",1);
        $("#scale").attr("disabled",false);
        setScaleFields();
    }
}

function setOutputOption(){
    if($("[name=output]:checked").attr("value")=="display"){
        $("#submitremotebutton").css("display","inline");
        $("#submitremotebutton").attr("disabled",false);
        $("#submitbutton").css("display","none");
        $("#submitbutton").attr("disabled",true);
    }
    else{
        $("#submitremotebutton").css("display","none");
        $("#submitremotebutton").attr("disabled",true);
        $("#submitbutton").css("display","inline");
        $("#submitbutton").attr("disabled",false);
    }
}
function validateForm(){
    if(isloading){
        return;
    }
    var error = false;
    var message = "";
    var type = $("#type").attr("value");
    var minscale = $("#minscale").attr("value");
    var maxscale = $("#maxscale").attr("value");
    var size = $("#size").attr("value");

    if(type=="float" || type=="double"){
        if(!isNumber(minscale)){
            error = true;
            message += "The minimum scale value has to be a valid floating point value<br />";
        }
        if(!isNumber(maxscale)){
            error = true;
            message += "The maximum scale value has to be a valid floating point value<br />";
        }
    }
    else if(type=="integer"){
        if(!isInteger(minscale)){
            error = true;
            message += "The minimum scale value has to be a valid integer value<br />";
        }
        if(!isInteger(maxscale)){
            error = true;
            message += "The maximum scale value has to be a valid integer value<br />";
        }
    }
    if(!error){
        minscale = parseFloat(minscale);
        maxscale = parseFloat(maxscale);
        if(maxscale<=minscale){
            error = true;
            message += "The maximum scale value has to be larger than the minimum scale value<br />";
        }
    }
    if(!isInteger(size)){
        error = true;
        message += "The amount of data has to be a valid integer value<br />"
    }
    else if(size<=0){
        error = true;
        message += "The amount of data has to be larger than 0<br />"
    }
    else if(size>5242880){
        error = true;
        message += "The amount of data has to be smaller than 5MB (5242880 bytes)<br />"
    }

    setOutputOption();
    if(error){
        setError(message);
    }
    else{
        setAPIurl();
        clearError();
    }
}
function setError(message){
    if($("#submitbutton").css("display")!="none"){
        $("#submitbutton").attr("disabled",true);
        $("#submitbutton").attr("class","submitdisabled");
        $("#submitbutton").fadeTo("normal",0.5);
    }
    if($("#submitremotebutton").css("display")!="none"){
        $("#submitremotebutton").attr("disabled",true);
        $("#submitremotebutton").attr("class","submitdisabled");
        $("#submitremotebutton").fadeTo("normal",0.5);
    }
    $("#errormessage").css("display","block");
    $("#errormessage").html(message);
    $("#errormessage").fadeTo("normal", 1);
    $("#apifield").fadeTo("fast",0);
    $("#apifield").css("display","none");
}
function clearError(){

    if($("#submitbutton").css("display")!="none"){
        $("#submitbutton").attr("disabled",false);
        $("#submitbutton").fadeTo("normal",1);
        $("#submitbutton").attr("class","submitbutton");
    }
    if($("#submitremotebutton").css("display")!="none"){
        $("#submitremotebutton").attr("disabled",false);
        $("#submitremotebutton").attr("class","submitbutton");
        $("#submitremotebutton").fadeTo("normal",1);
    }
    $("#errormessage").fadeTo("fast", 0);
    $("#errormessage").css("display","none");
    $("#apifield").css("display","block");
    $("#apifield").fadeTo("normal",1);
}
function isNumber(n){
    return !isNaN(parseFloat(n)) && isFinite(n);
}
function isInteger(n){
    return isNumber(n) && (n % 1 == 0);
}
function setAPIurl(){
    var url;
    if($("#type").attr("value")!="binary"){
        url = "qrandom.monash.edu.my/stream?";
        url += "type=" + $("#type").attr("value");
        url += "&format=" + $("#format").attr("value");
        if($("#scale").attr("checked")=="checked"){
            url += "&scale=" + $("#scale").attr("value");
            url += "&minscale=" + $("#minscale").attr("value");
            url += "&maxscale=" + $("#maxscale").attr("value");
        }
        url += "&size=" + $("#size").attr("value");
    }
    else{
        url ="(not available for binary type)";
    }
    //url += "&output=" + $("[name=output]:checked").attr("value");
    $("#apiurl").text(url);
}
function startLoadData(){
    isloading = true;
    $("#loading").fadeTo(600, 1);
    if($("#submitbutton").css("display")!="none"){
        $("#submitbutton").attr("disabled",true);
        $("#submitbutton").attr("class","submitdisabled");
        $("#submitbutton").fadeTo("normal",0.5);
    }
    if($("#submitremotebutton").css("display")!="none"){
        $("#submitremotebutton").attr("disabled",true);
        $("#submitremotebutton").attr("class","submitdisabled");
        $("#submitremotebutton").fadeTo("normal",0.5);
    }
    var message = "Please wait a while. Requests larger than 1MB may take up to 5 minutes";
    $("#errormessage").css("display","block");
    $("#errormessage").html(message);
    $("#errormessage").fadeTo("normal", 1);
}
function stopLoadData(){
    isloading = false;
    if($("#submitbutton").css("display")!="none"){
        $("#submitbutton").attr("disabled",false);
        $("#submitbutton").fadeTo("normal",1);
        $("#submitbutton").attr("class","submitbutton");
    }
    if($("#submitremotebutton").css("display")!="none"){
        $("#submitremotebutton").attr("disabled",false);
        $("#submitremotebutton").attr("class","submitbutton");
        $("#submitremotebutton").fadeTo("normal",1);
    }
    $("#loading").fadeTo("fast", 0);
    $("#loading").css("display","none");
    $("#errormessage").fadeTo("fast", 0);
    $("#errormessage").css("display","none");
}
function completeLoadData(){
    stopLoadData();
    validateForm();
    $("#displayfield").css("display","block");
    $("#displayfield").fadeTo(1000,1);
    var destination = $("#displayfield").offset().top ;
    var limit = $(document).height() - $(window).height();
    limit = limit<0 ? 0:limit;
    destination = limit<destination ? limit : destination;
    $("html:not(:animated),body:not(:animated)").animate({
        scrollTop: destination
    }, 1000 );
}

var fileDownloadCheckTimer;
function finishDownload() {
    window.clearInterval(fileDownloadCheckTimer);
    $.cookie("fileDownloadToken", null); //clears this cookie value
    stopLoadData();
}
function blockUIForDownload() {
    var token = new Date().getTime(); //use the current timestamp as the token value
    $("#token").val(token);
    startLoadData();
    fileDownloadCheckTimer = window.setInterval(function () {
        var cookieValue = $.cookie("fileDownloadToken");
        if (cookieValue == token)
            finishDownload();
    }, 1000);
}
$(document).ready(function(){
    $("#scale").click(setScaleFields);
    $("#type").change(setTypeOptions);
    $("form").change(validateForm);
    $("input").keyup(validateForm);
    //$("form input").keypress(function (e) {
    //    validateForm();
    //    if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
    //        if($("[name=output]:checked").attr("value")=="display")
    //            $("#submitremotebutton").click();
    //        else
    //            $("#submitbutton").click();
    //        return false;
    //    } else {
    //        return true;
    //    }
    //});
    $("form").submit(function(){
        blockUIForDownload();
    });
    setScaleFields();
    setTypeOptions();
    validateForm();
});