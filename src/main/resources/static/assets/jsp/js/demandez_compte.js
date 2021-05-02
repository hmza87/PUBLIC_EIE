
function checkmail(mail){
    var mail = $("#emaily").val();

    var getUrl = window.location;
    //var baseUrl = getUrl .protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
    var baseUrl = getUrl .protocol + "//" + getUrl.host;


    $.get( baseUrl+"/chackmail/"+mail , function(rep) {
        if(rep == "0"){
            $("#emaily").val(mail);
            $("#chekmail").text("");
        }else{
            $("#emaily").val("");
            $("#chekmail").text("cet email existe déjà");
        }

    })

}


    // Captcha Script

    function checkform(theform){
    var why = "";

    if(theform.CaptchaInput.value == ""){
    why += "- Veuillez saisir le code CAPTCHA.\n";

}
    if(theform.CaptchaInput.value != ""){
    if(ValidCaptcha(theform.CaptchaInput.value) == false){
    why += "- Le code CAPTCHA ne correspond pas.\n";
}
}
    if(why != ""){
    document.getElementById("CaptchaInput").style.backgroundColor = "#ff6a6a94";
    document.getElementById("CaptchaInput").style.color = "red";
    document.getElementById("CaptchaInput").style.border = "red";
    alert(why);
    return false;
}
}

    var a = Math.ceil(Math.random() * 9)+ '';
    var b = Math.ceil(Math.random() * 9)+ '';
    var c = Math.ceil(Math.random() * 9)+ '';
    var d = Math.ceil(Math.random() * 9)+ '';
    var e = Math.ceil(Math.random() * 9)+ '';

    var code = a + b + c + d + e;
    if(document.getElementById("txtCaptcha")){
        document.getElementById("txtCaptcha").value = code;
    }
    if(document.getElementById("CaptchaDiv")) {
        document.getElementById("CaptchaDiv").innerHTML = code;
    }
    // Validate input against the generated number
    function ValidCaptcha(){
    var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
    var str2 = removeSpaces(document.getElementById('Captchay').value);
    if (str1 == str2){
    return true;
}else{
    return false;
}
}

    // Remove the spaces from the entered and generated code
    function removeSpaces(string){
    return string.split(' ').join('');
}


    function ses_rc()
    {
        var ad=/(\w+)/;
        if(ad.test(form1.in_RC.value)==false){in_RC.innerHTML="<font color=red>*</font>";}
        else{ in_RC.innerHTML="<font color=green></font>";}
    }
    function ses_trib()
    {
        var ad=/(\w+)/;
        if(ad.test(form1.in_Tribunal.value)==false){in_Tribunal.innerHTML="<font color=red>*</font>";}
        else{ in_Tribunal.innerHTML="<font color=green></font>";}
    }
    function ses_ras()
    {
        var ad=/(\w+)/;
        if(ad.test(form1.in_Raison_Sociale.value)==false){in_Raison_Sociale.innerHTML="<font color=red>*</font>";}
        else{ in_Raison_Sociale.innerHTML="<font color=green></font>";}
    }
    function ses_ad()
    {
        var ad=/(\w+)/;
        if(ad.test(form1.in_Adresse.value)==false){in_Adresse.innerHTML="<font color=red>*</font>";}
        else{ in_Adresse.innerHTML="<font color=green></font>";}
    }
    function ses_tel()
    {
        var r =  /^\d{10}$/;
        if(r.test(form1.in_Telephone.value)==false){in_Telephone.innerHTML="<font color=red>numero de téléphone incorrect</font>";}
        else{ in_Telephone.innerHTML="<font color=green></font>";}
    }
    function ses_fax()
    {
        var r =  /^\d{10}$/;
        if(r.test(form1.in_fax.value)==false){in_fax.innerHTML="<font color=red>numero de Fax incorrect</font>";}
        else{ in_fax.innerHTML="<font color=green></font>";}
    }
    /* function ses_email()
    {
        var email=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

        if(email.test(form1.in_email.value)==false){in_email.innerHTML="<font color=red>email incorrect</font>";}
        else{ in_email.innerHTML="<font color=green></font>";}
    }*/
    function ses()
    {
        var r =  /^\d{10}$/;
        var ad=/(\w+)/;
        var email=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

        if(ad.test(form1.in_RC.value)==false){in_RC.innerHTML="<font color=red>*</font>";}
        else{ in_RC.innerHTML="<font color=green></font>";}
        if(ad.test(form1.in_Tribunal.value)==false){in_Tribunal.innerHTML="<font color=red>*</font>";}
        else{ in_Tribunal.innerHTML="<font color=green></font>";}
        if(ad.test(form1.in_Raison_Sociale.value)==false){in_Raison_Sociale.innerHTML="<font color=red>*</font>";}
        else{ in_Raison_Sociale.innerHTML="<font color=green></font>";}
        if(ad.test(form1.in_Adresse.value)==false){in_Adresse.innerHTML="<font color=red>*</font>";}
        else{ in_Adresse.innerHTML="<font color=green></font>";}
        if(r.test(form1.in_Telephone.value)==false){in_Telephone.innerHTML="<font color=red>numero de téléphone incorrect</font>";}
        else{ in_Telephone.innerHTML="<font color=green></font>";}
        if(r.test(form1.in_fax.value)==false){in_fax.innerHTML="<font color=red>numero de Fax incorrect</font>";}
        else{ in_fax.innerHTML="<font color=green></font>";}
        if(email.test(form1.in_email.value)==false){in_email.innerHTML="<font color=red>email incorrect</font>";}
        else{ in_email.innerHTML="<font color=green></font>";}
        // if(email.test(form1.in_email_c.value)==false){in_email_c.innerHTML="<font color=red>email incorrect</font>";}
        // else{ in_email_c.innerHTML="<font color=green></font>";}
    }
    /*   $(document).ready(function() {
    $(".image-info").on("click", function() {
        $('#imagepreview').attr('src', $('#myImg').attr('src')); // here asign the image to the modal when the user click the enlarge link
        $('#imagemodal').modal('show'); // imagemodal is the id attribute assigned to the bootstrap modal, then i use the show function
    });
}); */





    // Wait for the DOM to be ready
    $(function() {
    // Initialize form validation on the registration form.
    // It has the name attribute "registration"
    $("form[name='registration']").validate({




        // Specify validation rules
        rules: {
            // The key name on the left side is the name attribute
            // of an input field. Validation rules are defined
            // on the right side

            mane_fr: {
                required: true
            },
            email: {
                required: true
            },
            email_c: {
                required: true,
                equalTo: '#emaily' // <- any valid jQuery selector

            },
            password: {
                required: true,
                minlength: 6
            },
            password_c: {
                required: true,
                minlength: 6,
                equalTo: '#psw'

            },

            captcha : {
                required: true,
                number : true,
                minlength: 5,
                maxlength: 5,
                equalTo : '#txtCaptcha'
            },
            tel : {
                required: true,
                number : true,
                minlength:10,
                maxlength:10
            },
            fax : {
                required: true,
                number : true,
                minlength:10,
                maxlength:10
            },



        },


        // Specify validation error messages
        messages: {
            password: {
                required: "Veuillez fournir un mot de passe",
                minlength: "Votre mot de passe doit contenir au moins 6 caractères"
            },
            password_c: {
                required: "Veuillez fournir un mot de passe",
                minlength: "Votre mot de passe doit contenir au moins 6 caractères"
            },
            email: "S'il vous plaît, mettez une adresse email valide",
            username: "S'il vous plaît, mettez un username valide",
            email_c: "S'il vous plaît, mettez une adresse email valide",
            captcha: "S'il vous plaît, mettez un nombre valide",
            telephone: "S'il vous plaît, mettez un telephone valide",
            fax: "S'il vous plaît, mettez un fax valide",

        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function(form) {
            form.submit();
        }


    });



});



    //Select
    /* $("#selectProfilInscrit").select2({
    templateResult: formatOption
});*/

    function formatOption (option) {
    var $option = $(
    '<div><b>' + option.text + '</b></div><small>' + option.title + '</small>'
    );
    return $option;
};
    $(document).ready(function(){
    $('.info-doc').mouseover(function() {
        $(".image-info").removeAttr('style','display:none;');
    });
    $('.info-doc').mouseleave(function() {
    $(".image-info").css("display","none");
});
});
    function openModal()
    {
        window.open($('#myImg').attr('src'));
    }
