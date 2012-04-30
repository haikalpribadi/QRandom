function showJavaTutorial(){
    $("#cppTutorial").css("display","none");
    $("#pythonTutorial").css("display","none");
    $("#javaTutorial").fadeTo("normal",1);
    $("#cppTutorialButton").removeClass("currentTab");
    $("#pythonTutorialButton").removeClass("currentTab");
    $("#javaTutorialButton").addClass("currentTab");
}
function showCppTutorial(){
    $("#javaTutorial").css("display","none");
    $("#pythonTutorial").css("display","none");
    $("#cppTutorial").fadeTo("normal",1);
    $("#javaTutorialButton").removeClass("currentTab");
    $("#pythonTutorialButton").removeClass("currentTab");
    $("#cppTutorialButton").addClass("currentTab");
}
function showPythonTutorial(){
    $("#javaTutorial").css("display","none");
    $("#cppTutorial").css("display","none");
    $("#pythonTutorial").fadeTo("normal",1);
    $("#javaTutorialButton").removeClass("currentTab");
    $("#cppTutorialButton").removeClass("currentTab");
    $("#pythonTutorialButton").addClass("currentTab");
}
$(document).ready(function (){
    $("#tutorialTabPanel").css("display","block");
    $("#javaTutorialButton").addClass("currentTab");
    $("#cppTutorial").css("display","none");
    $("#pythonTutorial").css("display","none");

    $("#javaTutorialButton").click(showJavaTutorial);
    $("#cppTutorialButton").click(showCppTutorial);
    $("#pythonTutorialButton").click(showPythonTutorial);

    SyntaxHighlighter.all()

});

