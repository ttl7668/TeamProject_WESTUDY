$("document").ready(function(){

    $("#name").focusout(function(){
        if($("#name").val()==''){
            $("#name").css("borderColor","red")
            $("#svgName").css("display","inline-block")
            $("#msgName").css({"display":"inline","color":"red"})
        }else{
            $("#svgName").css("display","none")
            $("#msgName").text("");
            $("#name").css("border-color","rgb(221, 224, 226)");
        }
    })
    $("#phone").focusout(function(){
        if($("#phone").val()==''){
            $("#phone").css("borderColor","red")
            $("#svgPhone").css("display","inline-block")
            $("#msgPhone").css({"display":"inline","color":"red"})
        }else{
            $("#svgPhone").css("display","none")
            $("#msgPhone").text("")
            $("#phone").css("border-color","rgb(221, 224, 226)")
        }
    })

    $("#IcBtn1").click(function(){
        $("#Ic-Check1").css("display","inline")
        $("#Ic-Check2").hide();
    })
    $("#IcBtn2").click(function(){
        $("#Ic-Check2").css("display","inline")
        $("#Ic-Check1").hide();
    })

    $("#PaymentBtn").click(function(){
        if(($("#Ic-Check1").css("display")=="none") && ($("#Ic-Check2").css("display")=="none")){
            alert("결제방식을 선택해주세요.")

        }else if($("#Ic-Check2").css("display")!="none"){
            alert("무통장 입금은 준비중 입니다.")
        }else{
            alert("카드결제창api")
        }
    })


})